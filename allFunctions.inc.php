<?php
function ae_detect_ie() {
    if (isset($_SERVER['HTTP_USER_AGENT']) && (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false)) {
        return true;
	} else {
        return false;
	}
}
function headerLinkClass_detect($language) {
	return ($language == "is" ? "headerLinkIce" : "headerLink");
}
?>