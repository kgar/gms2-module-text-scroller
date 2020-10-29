function TextScroller(_surface, _contentSize, _singleScrollUnitPixels, _smoothScroll) constructor {
	#region Initial constructed fields
	surfaceSize = surface_get_height(_surface);
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
	
	function RecalculateScrollableContentSurface() {
		pageScrollUnitPixels = surfaceSize * 0.9;
		surfaceContentRatio = surfaceSize / contentSize;
		surfaceScrollAreaSize = contentSize - surfaceSize;
		OnBaseRecalculationCompleted();
		SetSurfacePosition(0);
	}
	
	function OnBaseRecalculationCompleted() {	}

	function SetSurfacePosition(_surfaceScrollPosition) {
		surfaceScrollPosition = _surfaceScrollPosition; 
		if (!smoothScroll || targetScrollPosition == undefined) {
			targetScrollPosition = surfaceScrollPosition;
		}
	}

	function ScrollUp() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition - singleScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			SetSurfacePosition(newPosition);
		}
	
	}

	function ScrollDown() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition + singleScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			SetSurfacePosition(newPosition);
		}
	}

	function PageUp() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition - pageScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			SetSurfacePosition(newPosition);
		}
	}

	function PageDown() {
		var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
		var newPosition = clamp(scrollPosition + pageScrollUnitPixels, 0, surfaceScrollAreaSize);
		if (smoothScroll) {
			targetScrollPosition = newPosition;
		} else {
			SetSurfacePosition(newPosition);
		}
	}

	function SmoothScrollTick() {
		if (targetScrollPosition = undefined) {
			return;
		}
		SetSurfacePosition(lerp(surfaceScrollPosition, targetScrollPosition, 0.35));
	}

	function ScrollToTop() {
		if (smoothScroll) {
			targetScrollPosition = 0;
		} else {
			SetSurfacePosition(0);
		}
	}

	function ScrollToBottom() {
		if (smoothScroll) {
			targetScrollPosition = surfaceScrollAreaSize;
		} else {
			SetSurfacePosition(surfaceScrollAreaSize);
		}
	}

	function CanScrollUp() {
		return smoothScroll 
			? targetScrollPosition > 0 
			: surfaceScrollPosition > 0;
	}

	function CanScrollDown() {
		return smoothScroll 
			? targetScrollPosition < surfaceScrollAreaSize 
			: surfaceScrollPosition < surfaceScrollAreaSize;
	}
	
	// Init routines
	RecalculateScrollableContentSurface();
}

function ScrollbarTextScroller(_surface, _contentSize, _singleScrollUnitPixels, _smoothScroll, _trackSize, _gripSizeMin) : TextScroller(_surface, _contentSize, _singleScrollUnitPixels, _smoothScroll) constructor {
	trackSize = _trackSize;
	gripSizeMin = _gripSizeMin;
	
	gripSize = undefined;
	trackScrollAreaSize = undefined;
	
	function OnBaseRecalculationCompleted() {
		gripSize = clamp(trackSize * surfaceContentRatio, gripSizeMin, trackSize);
		trackScrollAreaSize = trackSize - gripSize;
	}
	
	baseSetSurfacePosition = SetSurfacePosition;
	function SetSurfacePosition(_surfaceScrollPosition) {
		baseSetSurfacePosition(_surfaceScrollPosition);
		var surfacePositionRatio = surfaceScrollPosition / surfaceScrollAreaSize;
		gripPositionOnTrack = trackScrollAreaSize * surfacePositionRatio;
	}
	
	RecalculateScrollableContentSurface();
}