#!/bin/bash

function build
{
	docker build -t aimnor/transmission .
}

function run_rm
{
	download_dir=$(mktemp -d)
	incomplete_dir=$(mktemp -d)
	echo "Download Dir : ${download_dir}"
	echo "Incomplete Dir : ${incomplete_dir}"
	docker run --rm -ti -P -v $download_dir:/downloaded -v $incomplete_dir:/incomplete -v /tmp/torrent:/torrent aimnor/transmission $1
	rm -Rf ${download_dir}
}

function run
{
	download_dir=/opt/transmission/download
	incomplete_dir=/opt/transmission/incomplete
	torrent_dir=/opt/transmission/torrent
	echo "Download Dir : ${download_dir}"
	echo "Incomplete Dir : ${incomplete_dir}"
	echo "Torrent Dir : ${torrent_dir}"
	docker run --rm -t -P -v $download_dir:/downloaded -v $incomplete_dir:/incomplete -v $torrent_dir:/torrent aimnor/transmission $1
}


function test
{
	echo $1
	echo $2
}

to_launch=$1; shift
$to_launch $1 $2
