#!/bin/bash

declare -a pkgLangsBackup="${pkgLangs[@]}" # Backup the array in case the user cancels the removal operation
pkgLangs+=("Accept" "Cancel")
select pkgLang in "${pkgLangs[@]}"
do
  if [[ "$pkgLang" == "Accept" ]]
  then
    echo "Changes have been accepted"
    # Remove the "Accept" and "Cancel" from the array to reverse it to a semantically correct state (containing languages only!)
    unset pkgLangs[${#pkgLangs[@]}-1] # Remove the "Accept"
    unset pkgLangs[${#pkgLangs[@]}-1] # Remove the "Cancel"
    break
  elif [[ "$pkgLang" == "Cancel" ]]
  then
    echo "Changes have been cancelled"
    pkgLangs=( $pkgLangsBackup )
    break
  else
    echo "Removed $pkgLang from supported languages"
    pkgLangs=( ${pkgLangs[@]/"$pkgLang"} )  # Using only this here removes the selected properly!
    echo "New list of supported languages: "
    arg_display pkgLangs
  fi
done
