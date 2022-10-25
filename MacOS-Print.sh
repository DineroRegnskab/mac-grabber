#!/bin/bash

# Required printer info
readonly PRINTER_IP='10.24.243.42'
readonly PRINTER_NAME='HP_PageWide_Pro_477dw'
readonly PRINTER_DISPLAY_NAME='Dineros HP printer'
readonly PRINTER_LOCATION='Ved siden af døren/skabene ved IT afdelingen.'
# Requiring icon will prevent install if we can't get it
readonly REQUIRE_ICON=false
# Number of seconds to wait for TCP verification before exiting
readonly CHECK_TIMEOUT=5
# Base info
readonly PPD="~/Library/Caches/TemporaryItems/${PRINTER_NAME}.ppd"
readonly AIR_PPD='/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Versions/A/Resources/AirPrint.ppd'
readonly EXE='/System/Library/Printers/Libraries/ipp2ppd'

CheckPrinter() {
  echo -e "\033[1;30m👀 Et øjeblik! Vi tjekker lige at printeren er klar...\033[0m"
  local CHECK=$(/usr/bin/nc -G ${CHECK_TIMEOUT} -z ${PRINTER_IP} 631 2&> /dev/null; /bin/echo $?)

  if [ "$CHECK" != 0 ]; then
    echo -e "\033[1;31m❌ Åh åh... printeren kunne ikke tilføjes. Er du på kontoret? Og på VismaTech5 netværket?\033[0m"
    exit 1
  fi
}

CreatePPD() {
  $EXE ipp://${PRINTER_IP} "$AIR_PPD" > "$PPD"
}

InstallPrinter() {
  /usr/sbin/lpadmin -p ${PRINTER_NAME} -D "${PRINTER_DISPLAY_NAME}" -L "${PRINTER_LOCATION}" -E -v ipp://${PRINTER_IP} -P ${PPD} -o printer-is-shared=false
}

main() {
  CheckPrinter
  CreatePPD
  InstallPrinter
  echo -e "\033[1;32m✅ Printeren er nu tilføjet. Du kan lukke dette vindue igen.\033[0m"
}

main "@"
