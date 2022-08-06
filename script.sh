#!/bin/sh

ARG=$1


if [[ $ARG = 'musnix' ]]; then
	STATE=$(cat ~/.nix/configuration.nix | grep musnix.enable | grep true)
	if [[ ${STATE} == '' ]]; then
		echo "MUSN OFF"
	else
		echo "MUSN ON"
	fi
fi

if [[ $ARG = 'tlp' ]]; then
	STATE=$(cat ~/.nix/configuration.nix | grep tlp.enable | grep true)
	if [[ ${STATE} == '' ]]; then
		echo "TLP OFF"
	else
		echo "TLP ON"
	fi
fi

