@extends('layout')

@section('title', 'DTeam :: Add Wallet Code Success')
@section('css', asset('css/register.css'))

@section('content')

<div class="flex flex-col">
    <h1 class="text-white mb-6 text-sm bg-green-700 p-3" style="text-shadow: 1px 1px #5b5b5b;">Successfully added {{ count($walletCodes) }} x {{ 'Rp'.number_format($walletCodes[0]->amount, 0, ',', '.') }} wallet code(s)</h1>

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
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @if ($walletCodes->hasPages())
    <div class="mt-4 flex justify-center">
      {{ $walletCodes->links() }}
    </div>
  @endif
    <div class="mt-8">
        <a href="/admin/wallet/manage-wallet-code" class="blue-btn px-10 py-2">Back</a>
    </div>
</div>

@endsection
