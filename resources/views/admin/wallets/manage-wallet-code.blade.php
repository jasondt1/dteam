@extends('layout')

@section('css', asset('css/admin.css'))

@section('content')
    <div class="mb-8 flex flex-col md:flex-row gap-5 items-start md:items-center justify-between">
        <div class="max-w-content">
            <a href="/admin/wallet/add-wallet-code" class="blue-btn px-6 py-2">Add Wallet Code</a>
        </div>

        <div class="flex gap-4">
            <div class="relative">
                <form id="searchForm" action="{{ route('manage-wallet-code') }}" method="GET" class="flex items-center">
                    <input type="hidden" name="used" value={{ request('used') }}>
                    @foreach (request('amount', []) as $amount)
                    <input type="hidden" name="amount[]" value="{{ $amount }}">
                    @endforeach
                    <input type="text" name="search" id="search" placeholder="Search by Code" class="p-2 rounded text-white bg-1 w-40 md:w-60" value="{{ request('search') }}">
                    <button type="submit" class="white-btn rounded px-2 py-2 ml-2"><svg xmlns="http://www.w3.org/2000/svg" height="21px" viewBox="0 -960 960 960" width="21px" fill="#00000"><path d="M765-144 526-383q-30 22-65.79 34.5-35.79 12.5-76.18 12.5Q284-336 214-406t-70-170q0-100 70-170t170-70q100 0 170 70t70 170.03q0 40.39-12.5 76.18Q599-464 577-434l239 239-51 51ZM384-408q70 0 119-49t49-119q0-70-49-119t-119-49q-70 0-119 49t-49 119q0 70 49 119t119 49Z"/></svg></button>
                </form>
            </div>
            <div class="dropdown bg-white px-6 py-2">
                <button onclick="toggleDropdown()" class="dropbtn">Filter</button>
                <div id="myDropdown" class="dropdown-content">
                    <form id="filterForm" action={{ route('manage-wallet-code') }} method="GET">
                        <input type="hidden" name="search" value={{ request('search') }}>
                        <div class="p-4">
                            <div>
                                <label for="used" class="block text-gray-700">Used:</label>
                                <select name="used" id="used" class="block w-full mt-1 border-gray-200 border p-2">
                                    <option value="">All</option>
                                    <option value="1" {{ request('used') == '1' ? 'selected' : '' }}>Yes</option>
                                    <option value="0" {{ request('used') == '0' ? 'selected' : '' }}>No</option>
                                </select>
                            </div>
                            <div class="mt-4">
                                <label class="block text-gray-700">Amount:</label>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="15000" class="form-checkbox" {{ in_array('15000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp15.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="30000" class="form-checkbox" {{ in_array('30000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp30.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="45000" class="form-checkbox" {{ in_array('45000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp45.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="60000" class="form-checkbox" {{ in_array('60000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp60.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="90000" class="form-checkbox" {{ in_array('90000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp90.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="120000" class="form-checkbox" {{ in_array('120000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp120.000</span>
                                    </label>
                                </div>
                                <div class="mt-1">
                                    <label class="inline-flex items-center">
                                        <input type="checkbox" name="amount[]" value="150000" class="form-checkbox" {{ in_array('150000', request('amount', [])) ? 'checked' : '' }}>
                                        <span class="ml-2">Rp150.000</span>
                                    </label>
                                </div>
                            </div>
                            <div class="mt-4 flex justify-end">
                                <button type="submit" class="bg-blue-500 rounded text-white px-4 py-2">Apply</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>

    <div class="flex flex-col">
        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                    <table class="min-w-full divide-y divide-gray-200 text-white">
                        <thead class="bg-1">
                            <tr>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider w-5">
                                    No
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Wallet Code
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Amount
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Used
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Created At
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Used At
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($walletCodes as $key => $walletCode)
                            @php
                                $originalString = $walletCode->code;
                                $upperString = strtoupper($originalString);
                                $part1 = substr($upperString, 0, 4);
                                $part2 = substr($upperString, 4, 4);
                                $part3 = substr($upperString, 8, 4);
                                $formattedString = $part1 . '-' . $part2 . '-' . $part3;
                                $rowClass = $key % 2 == 1 ? 'bg-1' : 'bg-2';
                                $pageNumber = $walletCodes->currentPage();
                                $index = ($pageNumber - 1) * $walletCodes->perPage() + $loop->index + 1;
                            @endphp
                            <tr class="{{ $rowClass }} text-white">
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $index }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $formattedString }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ 'Rp'.number_format($walletCode->amount, 0, ',', '.') }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $walletCode->is_used ? 'Yes' : 'No'}}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $walletCode->created_at }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $walletCode->used_at ? $walletCode->used_at : '-'}}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    @if($walletCodes->count() == 0)
                    <p class="w-full text-center my-4">No results</p>
                    @endif
                </div>
            </div>
        </div>
        @if ($walletCodes->hasPages())
        <div class="mt-4 flex justify-center">
          {{ $walletCodes->links() }}
        </div>
        @endif
      </div>
      <script>
        function toggleDropdown() {
          var dropdownMenu = document.getElementById("myDropdown");
          if (dropdownMenu.style.display === "none" || dropdownMenu.style.display === "") {
            dropdownMenu.style.display = "block";
            dropdownMenu.classList.remove("fade-out");
            dropdownMenu.classList.add("fade-in");
          } else {
            dropdownMenu.classList.remove("fade-in");
            dropdownMenu.classList.add("fade-out");
            setTimeout(function() {
              dropdownMenu.style.display = "none";
            }, 300);
          }
        }

        document.addEventListener('click', function(event) {
        var dropdownMenu = document.getElementById("myDropdown");
        var dropbtn = document.querySelector('.dropbtn');

        if (!dropdownMenu.contains(event.target) && event.target !== dropbtn) {
            dropdownMenu.classList.remove("fade-in");
            dropdownMenu.classList.add("fade-out");
            setTimeout(function() {
                dropdownMenu.style.display = "none";
            }, 300);
        }
    });
      </script>
@endsection

