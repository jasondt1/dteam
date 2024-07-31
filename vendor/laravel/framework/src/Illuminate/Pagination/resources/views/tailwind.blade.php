@if ($paginator->hasPages())
  <div class="w-full justify-center flex mt-4">
    <ul class="flex items-center space-x-2 text-base">

      {{-- Previous Page Link --}}
      @if ($paginator->onFirstPage())
        <li>
          <span class="flex items-center justify-center px-4 py-2 text-gray-600 bg-gray-800 border border-gray-700 rounded-lg cursor-not-allowed">
            <svg class="w-3 h-3 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
            </svg>
          </span>
        </li>
      @else
        <li>
          <a href="{{ $paginator->previousPageUrl() }}" class="flex items-center justify-center px-4 py-2 text-gray-200 bg-gray-800 border border-gray-700 rounded-lg transition-transform transform hover:-translate-x-1 hover:bg-gray-700">
            <svg class="w-3 h-3 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
            </svg>
          </a>
        </li>
      @endif

      {{-- Pagination Elements --}}
      @php
        $maxPages = 5; // Number of pages to display
        $currentPage = $paginator->currentPage();
        $lastPage = $paginator->lastPage();

        $start = max(1, $currentPage - floor($maxPages / 2));
        $end = min($lastPage, $currentPage + floor($maxPages / 2));

        if ($end - $start < $maxPages - 1) {
            if ($start == 1) {
                $end = min($start + $maxPages - 1, $lastPage);
            } else {
                $start = max($end - $maxPages + 1, 1);
            }
        }
      @endphp

      @foreach (range($start, $end) as $page)
        @if ($page == $currentPage)
          <li>
            <span aria-current="page" class="z-10 flex items-center justify-center px-4 py-2 text-gray-100 bg-blue-600 border border-blue-500 rounded-lg">
              {{ $page }}
            </span>
          </li>
        @else
          <li>
            <a href="{{ $paginator->url($page) }}" class="flex items-center justify-center px-4 py-2 text-gray-200 bg-gray-800 border border-gray-700 rounded-lg transition-colors hover:bg-gray-700">
              {{ $page }}
            </a>
          </li>
        @endif
      @endforeach

      {{-- Next Page Link --}}
      @if ($paginator->hasMorePages())
        <li>
          <a href="{{ $paginator->nextPageUrl() }}" class="flex items-center justify-center px-4 py-2 text-gray-200 bg-gray-800 border border-gray-700 rounded-lg transition-transform transform hover:translate-x-1 hover:bg-gray-700">
            <svg class="w-3 h-3 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
            </svg>
          </a>
        </li>
      @else
        <li>
          <span class="flex items-center justify-center px-4 py-2 text-gray-600 bg-gray-800 border border-gray-700 rounded-lg cursor-not-allowed">
            <svg class="w-3 h-3 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
            </svg>
          </span>
        </li>
      @endif
    </ul>
  </div>
@endif
