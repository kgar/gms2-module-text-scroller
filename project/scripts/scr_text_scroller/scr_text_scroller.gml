function TextScroller(_surfaceSize, _contentSize, _singleScrollUnitPixels, _smoothScroll) constructor {
	#region Initial constructed fields
	surfaceSize = _surfaceSize;
	contentSize = _contentSize;
	singleScrollUnitPixels = _singleScrollUnitPixels;
	smoothScroll = _smoothScroll;
	#endregion
	
	#region Calculated fields
	surfaceContentRatio = undefined;
	surfaceScrollAreaSize = undefined;
	pageScrollUnitPixels = undefined; // Represents 1 page of content (possibly minus a little for breathing room)
	#endregion

	#region Frequently updated positioning fields
	surfaceScrollPosition = undefined;
	targetScrollPosition = undefined;
	gripPositionOnTrack = undefined;
	#endregion
	
	function recalculate() {
		pageScrollUnitPixels = surfaceSize * 0.9;
		surfaceContentRatio = surfaceSize / contentSize;
		surfaceScrollAreaSize = contentSize - surfaceSize;
		on_base_recalculation_completed();
		set_scroll_position(0);
	}
	
	function on_base_recalculation_completed() {	}

	function set_scroll_position(_surfaceScrollPosition) {
		surfaceScrollPosition = _surfaceScrollPosition; 
		if (!smoothScroll || targetScrollPosition == undefined) {
			targetScrollPosition = surfaceScrollPosition;
		}
	}

	function scroll_up() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition - singleScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			set_scroll_position(newPosition);
		}
	
	}

	function scroll_down() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition + singleScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			set_scroll_position(newPosition);
		}
	}

	function page_up() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition - pageScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			set_scroll_position(newPosition);
		}
	}

	function page_down() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition + pageScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			set_scroll_position(newPosition);
		}
	}

	function smooth_scroll_step() {
		if (targetScrollPosition = undefined) {
			return;
		}
		set_scroll_position(lerp(surfaceScrollPosition, targetScrollPosition, 0.35));
	}

	function scroll_to_top() {
		if (smoothScroll) {
			targetScrollPosition = 0;
		} else {
			set_scroll_position(0);
		}
	}

	function scroll_to_bottom() {
		if (smoothScroll) {
			targetScrollPosition = surfaceScrollAreaSize;
		} else {
			set_scroll_position(surfaceScrollAreaSize);
		}
	}

	function can_scroll_up() {
		return smoothScroll 
			? targetScrollPosition > 0 
			: surfaceScrollPosition > 0;
	}

	function can_scroll_down() {
		return smoothScroll 
			? targetScrollPosition < surfaceScrollAreaSize 
			: surfaceScrollPosition < surfaceScrollAreaSize;
	}
	
	// Init routines
	recalculate();
}

function ScrollbarTextScroller(_surfaceSize, _contentSize, _singleScrollUnitPixels, _smoothScroll, _trackSize, _gripSizeMin) : TextScroller(_surfaceSize, _contentSize, _singleScrollUnitPixels, _smoothScroll) constructor {
	trackSize = _trackSize;
	gripSizeMin = _gripSizeMin;
	
	gripSize = undefined;
	trackScrollAreaSize = undefined;
	
	function on_base_recalculation_completed() {
		gripSize = clamp(trackSize * surfaceContentRatio, gripSizeMin, trackSize);
		trackScrollAreaSize = trackSize - gripSize;
	}
	
	baseSetSurfacePosition = set_scroll_position;
	function set_scroll_position(_surfaceScrollPosition) {
		baseSetSurfacePosition(_surfaceScrollPosition);
		var surfacePositionRatio = surfaceScrollPosition / surfaceScrollAreaSize;
		gripPositionOnTrack = trackScrollAreaSize * surfacePositionRatio;
	}
	
	recalculate();
}