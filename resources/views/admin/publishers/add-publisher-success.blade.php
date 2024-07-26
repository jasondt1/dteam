@extends('layout')

@section('css', asset('css/register.css'))

@section('content')
<div class="mt-16 p-0 lg:px-8 flex flex-col gap-8">
    <h1 class="text-4xl text-white font-light">An Email has been sent to:</h1>
    <p class="text-gray-300 text-sm">{{ $email }}</p>
    <p class="text-gray-200 text-base mt-2">
      Please notify the publisher to check their email.
    </p>
    <div class="mt-8">
      <a href="/admin/publisher/manage-publisher" class="blue-btn px-10 py-2">Back</a>
    </div>
  </div>
@endsection
