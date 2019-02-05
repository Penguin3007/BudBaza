@if ($paginator->hasPages())
      <ul class="page-pagination">
            @if ($paginator->onFirstPage())
                  <li><a disabled href="javascript:void(0)"><i class="fa fa-angle-left"></i>Назад</a></li>
            @else
                  <li><a disabled href="{{ $paginator->previousPageUrl() }}"><i class="fa fa-angle-left"></i>Назад</a></li>
            @endif



            @foreach ($elements as $element)
                  @if (is_string($element))
                      <li>-----</li>
                  @endif

                  @if (is_array($element))
                      @foreach ($element as $page => $url)
                          @if ($page == $paginator->currentPage())
                              <li class="active"><a href="javascript:void(0)">{{ $page }}</a></li>
                          @else
                              <li><a href="{{ $url }}">{{ $page }}</a></li>
                          @endif
                      @endforeach
                  @endif
            @endforeach



            @if ($paginator->hasMorePages())
                  <li><a href="{{ $paginator->nextPageUrl() }}"><i class="fa fa-angle-right"></i>Дальше</a></li>
              @else
                   <li><a disabled href="javascript:void(0)"><i class="fa fa-angle-right"></i>Дальше</a></li>
              @endif
      </ul>
@endif