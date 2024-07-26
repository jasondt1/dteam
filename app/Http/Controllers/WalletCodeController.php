<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\WalletCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class WalletCodeController extends Controller
{
    public function add(Request $request){
        $rules = [
            'amount' => 'required|numeric',
            'quantity' => 'required|numeric|max:100|min:1',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $quantity = $request->input('quantity');
        $codes = [];

        for ($i = 0; $i < $quantity; $i++) {
            $codes[] = Str::random(12);
        }

        session()->put('add_wallet_time', now());

        foreach ($codes as $code) {
            $walletCode = new WalletCode();
            $walletCode->code = $code;
            $walletCode->amount = $request->input('amount');
            $walletCode->save();
        }

        return redirect()->route('wallet-add-success');
    }

    public function success(){
        $time = session('add_wallet_time');
        $walletCodes = WalletCode::where('created_at', '>=', $time)->paginate(10);
        return view('admin/wallets/add-wallet-code-success', ['walletCodes' => $walletCodes]);
    }

    public function getAll(Request $request){
        $query = WalletCode::query();

        if ($request->has('search') && $request->search != '') {
            $search = str_replace(['-', ' '], '', $request->search);
            $query->where('code', 'like', '%' . $search . '%');
        }

        if ($request->has('used') && $request->used !== '') {
            $num = (int)$request->used;
            $query->where('is_used', $num);
        }

        if ($request->has('amount') && is_array($request->amount)) {
            $query->whereIn('amount', $request->amount);
        }

        $query->orderBy('created_at', 'desc');

        $walletCodes = $query->paginate(10);

        return view('admin/wallets/manage-wallet-code', ['walletCodes' => $walletCodes]);
    }

    public function redeem(Request $request){
        $rules = [
            'code' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $code = strtoupper(str_replace('-', '', $request->input('code')));

        $walletCode = WalletCode::whereRaw('UPPER(REPLACE(code, "-", "")) = ?', [$code])->first();

        if (!$walletCode) {
            return back()->withErrors(['code' => 'Invalid wallet code'])->withInput();
        }

        if ($walletCode->is_used) {
            return back()->withErrors(['code' => 'Wallet code has been used'])->withInput();
        }

        $walletCode->is_used = true;
        $walletCode->used_at = now();
        $walletCode->user_id = auth()->user()->id;
        $walletCode->save();

        $user = User::find(auth()->user()->id);
        $user->wallet = $user->wallet + $walletCode->amount;
        $user->save();

        return back()->with('success', 'Code redeemed successfully');
    }

}
