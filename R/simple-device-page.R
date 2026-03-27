#' Playback device self-report page
#'
#' This function creates a page where participant report their playback device.
#'
#' @inheritParams HALT
#'
#' @export
simple_device_page <- function(dict = HALT::HALT_dict) {
  psychTestR::new_timeline(
    psychTestR::NAFC_page(
      label = "playback_device",
      prompt = psychTestR::i18n("DEVICE_PROMPT"),
      choices = as.character(1:6),
      labels = purrr::map_chr(
        sprintf("DEVICE_CHOICE%d", 1:6),
        psychTestR::i18n
      ),
      on_complete = function(answer, state, ...) {
        device_names <- c("headphones",
                          "laptop_speakers",
                          "loudspeakers",
                          "smartphone_speakers",
                          "tablet_speakers",
                          "monitor_speakers")
        psychTestR::save_result(
          place = state,
          label = "device_selfreport",
          value = device_names[as.integer(answer)]
        )
      },
      arrange_vertically =  TRUE,
      save_answer = FALSE,
      button_style = "width:300px"
    ),
    dict = dict
  )
}
