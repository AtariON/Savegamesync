#!/usr/bin/env python3
# gTranscribe is a software focused on easy transcription of spoken words.
# Copyright (C) 2020 AtariON <atarion-rgl@web.de>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import DistUtilsExtra.auto

DistUtilsExtra.auto.setup(
    name='gTranscribe',
    version='0.8',
    license='GPL-3',
    author='AtariON',
    author_email='atarion-rgl@web.de',
    description='Savegamesync',
    long_description='Savegamesync is a little Code for Backup your Savegames on your NAS'
    url='https://github.com/AtariON/Savegamesync-for-RetroPie.git',
    data_files=[('share/metainfo', ['org.innir.Savegamesync.appdata.xml'])]
)
