@extends('layout')

@section('title', 'DTeam :: Add Wallet Code')
@section('css', asset('css/register.css'))

@section('content')
    <form action={{ route('data-wallet-add') }} class="p-0 lg:px-8 flex flex-col gap-8" method="POST">
        @csrf
        <div class="w-full">
            @if ($errors->any())
            <div class="bg-black w-full p-3 border border-[#C15755]">
                @php $count = 0; @endphp
                @foreach ($errors->all() as $error)
                    @if ($count == 2)
                        <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">More errors highlighted below.</p>
                        @break
                    @endif
                    <p class="text-white text-sm" style="text-shadow: 1px 1px #5b5b5b;">{{ $error }}</p>
                    @php $count++; @endphp
                @endforeach
            </div>
            @endif
        </div>
        <h1 class="text-4xl text-white font-light">ADD WALLET CODE</h1>
        <div class="flex flex-col">
            <label for="amount" class="text-gray-300 text-sm">Amount</label>
            <select name="amount" id="amount" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('amount') border border-[#C15755] @enderror">
                <option value="" disabled {{ old('amount') == '' ? 'selected' : '' }}>Select an amount</option>
                <option value="15000" {{ old('amount') == '15000' ? 'selected' : '' }}>Rp15.000</option>
                <option value="30000" {{ old('amount') == '30000' ? 'selected' : '' }}>Rp30.000</option>
                <option value="45000" {{ old('amount') == '45000' ? 'selected' : '' }}>Rp45.000</option>
                <option value="60000" {{ old('amount') == '60000' ? 'selected' : '' }}>Rp60.000</option>
                <option value="90000" {{ old('amount') == '90000' ? 'selected' : '' }}>Rp90.000</option>
                <option value="120000" {{ old('amount') == '120000' ? 'selected' : '' }}>Rp120.000</option>
                <option value="150000" {{ old('amount') == '150000' ? 'selected' : '' }}>Rp150.000</option>
            </select>
        </div>
        <div class="flex flex-col">
            <label for="quantity" class="text-gray-300 text-sm">Quantity</label>
            <input type="text" name="quantity" id="quantity" class="w-full md:max-w-80 h-9 rounded-sm field-bg px-3 text-white @error('quantity') border border-[#C15755] @enderror" value={{ old('quantity') }}>
        </div>
        <button type="submit" class="blue-btn w-full md:max-w-40 py-2">Add</button>
    </form>

@endsection
