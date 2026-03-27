#' Playback device self-report page
#'
#' This function creates a page where participant report their playback device.
#'
#' @inheritParams HALT
#'
#' @export
simple_device_page <- function(dict = HALT::HALT_dict) {
  psychTestR::new_timeline(
    psychTestR::join(
      psychTestR::NAFC_page(
        label = "playback_device",
        prompt = psychTestR::i18n("DEVICE_PROMPT"),
        choices = as.character(1:6),
        labels = purrr::map_chr(
          sprintf("DEVICE_CHOICE%d", 1:6),
          psychTestR::i18n
        ),
        arrange_vertically =  TRUE,
        save_answer = TRUE,
        button_style = "width:300px"
      )
    ),
    dict = dict
  )
}
