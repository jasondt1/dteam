@extends('layout')

@section('title', 'DTeam :: Manage Genre')
@section('css', asset('css/admin.css'))

@section('content')
    <div class="mb-8 flex flex-col md:flex-row gap-5 items-start md:items-center justify-between">
        <div class="max-w-content">
            <a href="/admin/genre/add-genre" class="blue-btn px-6 py-2">Add Genre</a>
        </div>

        <div class="flex gap-4">
            <div class="relative">
                <form id="searchForm" action="{{ route('manage-genre') }}" method="GET" class="flex items-center">
                    <input type="text" name="search" id="search" placeholder="Search by Genre Name" class="p-2 rounded text-white bg-1 w-40 md:w-60" value="{{ request('search') }}">
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
                                    Genre Name
                                </th>
                                <th scope="col" class="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($genres as $key => $genre)
                            @php
                            $rowClass = $key % 2 == 1 ? 'bg-1' : 'bg-2';
                            $pageNumber = $genres->currentPage();
                            $index = ($pageNumber - 1) * $genres->perPage() + $loop->index + 1;
                            @endphp
                            <tr class="{{ $rowClass }} text-white">
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $index }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    {{ $genre->name }}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <div class="flex gap-1">
                                        <a href="/admin/genre/edit-genre/{{ $genre->id }}" class="p-2 rounded-full white-btn">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#000000">
                                                <path d="M216-216h51l375-375-51-51-375 375v51Zm-72 72v-153l498-498q11-11 23.84-16 12.83-5 27-5 14.16 0 27.16 5t24 16l51 51q11 11 16 24t5 26.54q0 14.45-5.02 27.54T795-642L297-144H144Zm600-549-51-51 51 51Zm-127.95 76.95L591-642l51 51-25.95-25.05Z"/>
                                            </svg>
                                        </a>
                                        <button type="button" onclick="confirmDelete({{ $genre->id }})" class="p-2 rounded-full white-btn">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#000000">
                                                <path d="M312-144q-29.7 0-50.85-21.15Q240-186.3 240-216v-480h-48v-72h192v-48h192v48h192v72h-48v479.57Q720-186 698.85-165T648-144H312Zm336-552H312v480h336v-480ZM384-288h72v-336h-72v336Zm120 0h72v-336h-72v336ZM312-696v480-480Z"/>
                                            </svg>
                                        </button>
                                        <form id="deleteForm-{{ $genre->id }}" action="{{ route('data-genre-delete', ['id' => $genre->id]) }}" method="POST" class="hidden">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    @if($genres->count() == 0)
                    <p class="w-full text-center my-4">No results</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @if ($genres->hasPages())
    <div class="mt-4 flex justify-center">
      {{ $genres->links() }}
    </div>
    @endif

    <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden text-white">
        <div class="bg-2 rounded-lg p-6 w-1/3">
            <h2 class="text-xl mb-4 font-weight-bold">Confirm Delete</h2>
            <p class="mb-6">Are you sure you want to delete this genre?</p>
            <div class="flex justify-end gap-2">
              <button id="cancelButton" class="px-4 py-2 bg-gray-50 text-black rounded hover:bg-gray-200 hover:text-gray-800">Cancel</button>
              <button id="confirmButton" class="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700">Delete</button>
            </div>
          </div>
    </div>

    <script>
        let genreIdToDelete = null;
        function confirmDelete(id) {
            genreIdToDelete = id;
            document.getElementById('deleteModal').classList.remove('hidden');
        }

        document.getElementById('cancelButton').addEventListener('click', function() {
            genreIdToDelete = null;
            document.getElementById('deleteModal').classList.add('hidden');
        });

        document.getElementById('confirmButton').addEventListener('click', function() {
            if (genreIdToDelete) {
                document.getElementById(`deleteForm-${genreIdToDelete}`).submit();
            }
        });

        document.addEventListener('click', function(event) {
            var modal = document.getElementById('deleteModal');
            if (event.target === modal) {
                genreIdToDelete = null;
                modal.classList.add('hidden');
            }
        });
    </script>
@endsection
