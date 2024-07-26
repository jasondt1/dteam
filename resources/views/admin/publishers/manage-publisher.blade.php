@extends('layout')

@section('css', asset('css/admin.css'))

@section('content')
    <div class="mb-8 flex flex-col md:flex-row gap-5 items-start md:items-center justify-between">
        <div class="max-w-content">
            <a href="/admin/publisher/add-publisher" class="blue-btn px-6 py-2">Add Publisher</a>
        </div>

        <div class="flex gap-4">
            <div class="relative">
                <form id="searchForm" action="{{ route('manage-publisher') }}" method="GET" class="flex items-center">
                    <input type="text" name="search" id="search" placeholder="Search by Publisher Name" class="p-2 rounded text-white bg-1 w-40 md:w-60" value="{{ request('search') }}">
                    <button type="submit" class="white-btn rounded px-2 py-2 ml-2">
                        <svg xmlns="http://www.w3.org/2000/svg" height="21px" viewBox="0 -960 960 960" width="21px" fill="#00000">
                            <path d="M765-144 526-383q-30 22-65.79 34.5-35.79 12.5-76.18 12.5Q284-336 214-406t-70-170q0-100 70-170t170-70q100 0 170 70t70 170.03q0 40.39-12.5 76.18Q599-464 577-434l239 239-51 51ZM384-408q70 0 119-49t49-119q0-70-49-119t-119-49q-70 0-119 49t-49 119q0 70 49 119t119 49Z"/>
                        </svg>
                    </button>
                </form>
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
                                    Publisher Logo
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Publisher Name
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Publisher Website
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($publishers as $key => $publisher)
                            @php
                            $rowClass = $key % 2 == 1 ? 'bg-1' : 'bg-2';
                            $pageNumber = $publishers->currentPage();
                            $index = ($pageNumber - 1) * $publishers->perPage() + $loop->index + 1;
                            @endphp
                            <tr class="{{ $rowClass }} text-white">
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $index }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="h-12 w-12">
                                        <img class="w-full h-full" src={{ $publisher->image_url }} alt="">
                                    </div>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $publisher->name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <a href={{ $publisher->website }} class="underline">{{ $publisher->website }}</a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    @if($publishers->count() == 0)
                    <p class="w-full text-center my-4">No results</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @if ($publishers->hasPages())
    <div class="mt-4 flex justify-center">
      {{ $publishers->links() }}
    </div>
    @endif
@endsection
