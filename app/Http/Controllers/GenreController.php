<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use App\Models\WalletCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class GenreController extends Controller
{
    public function add(Request $request){
        $rules = [
            'genre_name' => 'required|unique:genres,name|max:255',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $newGenre = new Genre();

        $newGenre->name = $request->genre_name;

        $newGenre->save();
        return redirect()->route('manage-genre');
    }

    public function getAll(Request $request){
        $query = Genre::query();

        if ($request->has('search') && $request->search != '') {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $query->where('is_active', true);

        $query->orderBy('updated_at', 'desc');

        $genres = $query->paginate(10);

        return view('admin/genres/manage-genre', ['genres' => $genres]);
    }

    public function edit(Request $request){
        $genre = Genre::where('id', $request->id)->where('is_active', true)->first();

        if (!$genre) {
            return redirect()->back();
        }

        return view('admin/genres/edit-genre', ['genre' => $genre]);
    }

    public function update(Request $request){
        $rules = [
            'genre_name' => [
                'required',
                Rule::unique('genres', 'name')->ignore($request->id),
                'max:255',
            ],
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $genre = Genre::find($request->id);
        $genre->name = $request->genre_name;
        $genre->save();
        return redirect()->route('manage-genre');
    }

    public function destroy(Request $request){
        $genre = Genre::find($request->id);
        $genre->is_active = false;
        $genre->save();
        return redirect()->route('manage-genre');
    }

    public function viewStore(){
        $games = Genre::all();
        return view('store', ['games' => $games]);
    }
}
