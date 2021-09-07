Class dc.bi.PopSongs Extends %Library.Persistent [ Not Abstract, DdlAllowed, Not LegacyInstanceContext, ProcedureBlock ]
{

Property date As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 2 ];

Property year As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 3 ];

Property title As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 4 ];

Property simpletitle As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 5, SqlFieldName = simple_title ];

Property artist As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 6 ];

Property mainartist As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 7, SqlFieldName = main_artist ];

Property peakpos As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 8, SqlFieldName = peak_pos ];

Property lastpos As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 9, SqlFieldName = last_pos ];

Property weeks As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 10 ];

Property rank As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 11 ];

Property change As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 12 ];

Property spotifylink As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 13, SqlFieldName = spotify_link ];

Property spotifyid As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 14, SqlFieldName = spotify_id ];

Property videolink As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 15, SqlFieldName = video_link ];

Property genre As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 16 ];

Property broadgenre As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 17, SqlFieldName = broad_genre ];

Property analysisurl As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 18, SqlFieldName = analysis_url ];

Property energy As %Library.Currency [ SqlColumnNumber = 19 ];

Property liveness As %Library.Currency [ SqlColumnNumber = 20 ];

Property tempo As %Library.Currency [ SqlColumnNumber = 21 ];

Property speechiness As %Library.Currency [ SqlColumnNumber = 22 ];

Property acousticness As %Library.Currency [ SqlColumnNumber = 23 ];

Property instrumentalness As %Library.Currency [ SqlColumnNumber = 24 ];

Property timesignature As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 25, SqlFieldName = time_signature ];

Property danceability As %Library.Currency [ SqlColumnNumber = 26 ];

Property key As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 27 ];

Property durationms As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 28, SqlFieldName = duration_ms ];

Property loudness As %Library.Currency [ SqlColumnNumber = 29 ];

Property valence As %Library.Currency [ SqlColumnNumber = 30 ];

Property mode As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 31 ];

Property lyrics As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 32 ];

Relationship genres As dc.bi.SongsGenres [ Cardinality = children, Inverse = song ];

ClassMethod Import(pSelectMode As %Library.Integer = {$zu(115,5)}, pFileName As %Library.String(MAXLEN=""), pDelimiter As %String = ",", pQuote As %String = """", pHeaders As %Integer = 0, ByRef pRecordCount As %Integer) As %Library.Integer [ SqlProc ]
{
	set tStatementId = $SYSTEM.Util.CreateGUID(), tCounter = 0, pRecordCount = 0
	set tPreparedStatement = ##class(%SQL.DynamicStatement).Prepare(tStatementId,..#ROWTYPE,pDelimiter,pQuote,,,0,"CSV")
	if $Isobject(tPreparedStatement) {
		set tImporter = tPreparedStatement.%New(tPreparedStatement,,pFileName,pDelimiter,pQuote)
		if $Isobject(tImporter) {
			do ..%DeleteExtent(,.tDeleted,.tInstances,1)
				// burn the column headers
			for tPtr = 1:1:pHeaders { do tImporter.%Next() }
			while tImporter.%Next() {
				set tMe = ..%New()
				if 'pSelectMode {
					set tMe.date = tImporter.%GetData(1)
					set tMe.year = tImporter.%GetData(2)
					set tMe.title = tImporter.%GetData(3)
					set tMe.simpletitle = tImporter.%GetData(4)
					set tMe.artist = tImporter.%GetData(5)
					set tMe.mainartist = tImporter.%GetData(6)
					set tMe.peakpos = tImporter.%GetData(7)
					set tMe.lastpos = tImporter.%GetData(8)
					set tMe.weeks = tImporter.%GetData(9)
					set tMe.rank = tImporter.%GetData(10)
					set tMe.change = tImporter.%GetData(11)
					set tMe.spotifylink = tImporter.%GetData(12)
					set tMe.spotifyid = tImporter.%GetData(13)
					set tMe.videolink = tImporter.%GetData(14)
					set tMe.genre = tImporter.%GetData(15)
					set tMe.broadgenre = tImporter.%GetData(16)
					set tMe.analysisurl = tImporter.%GetData(17)
					set tMe.energy = tImporter.%GetData(18)
					set tMe.liveness = tImporter.%GetData(19)
					set tMe.tempo = tImporter.%GetData(20)
					set tMe.speechiness = tImporter.%GetData(21)
					set tMe.acousticness = tImporter.%GetData(22)
					set tMe.instrumentalness = tImporter.%GetData(23)
					set tMe.timesignature = tImporter.%GetData(24)
					set tMe.danceability = tImporter.%GetData(25)
					set tMe.key = tImporter.%GetData(26)
					set tMe.durationms = tImporter.%GetData(27)
					set tMe.loudness = tImporter.%GetData(28)
					set tMe.valence = tImporter.%GetData(29)
					set tMe.mode = tImporter.%GetData(30)
					set tMe.lyrics = tImporter.%GetData(31)
				}
				elseif pSelectMode = 1 {
					set tMe.date = $s('$system.CLS.IsMthd("dateOdbcToLogical"):tImporter.%GetData(1),1:tMe.dateOdbcToLogical(tImporter.%GetData(1)))
					set tMe.year = $s('$system.CLS.IsMthd("yearOdbcToLogical"):tImporter.%GetData(2),1:tMe.yearOdbcToLogical(tImporter.%GetData(2)))
					set tMe.title = $s('$system.CLS.IsMthd("titleOdbcToLogical"):tImporter.%GetData(3),1:tMe.titleOdbcToLogical(tImporter.%GetData(3)))
					set tMe.simpletitle = $s('$system.CLS.IsMthd("simpletitleOdbcToLogical"):tImporter.%GetData(4),1:tMe.simpletitleOdbcToLogical(tImporter.%GetData(4)))
					set tMe.artist = $s('$system.CLS.IsMthd("artistOdbcToLogical"):tImporter.%GetData(5),1:tMe.artistOdbcToLogical(tImporter.%GetData(5)))
					set tMe.mainartist = $s('$system.CLS.IsMthd("mainartistOdbcToLogical"):tImporter.%GetData(6),1:tMe.mainartistOdbcToLogical(tImporter.%GetData(6)))
					set tMe.peakpos = $s('$system.CLS.IsMthd("peakposOdbcToLogical"):tImporter.%GetData(7),1:tMe.peakposOdbcToLogical(tImporter.%GetData(7)))
					set tMe.lastpos = $s('$system.CLS.IsMthd("lastposOdbcToLogical"):tImporter.%GetData(8),1:tMe.lastposOdbcToLogical(tImporter.%GetData(8)))
					set tMe.weeks = $s('$system.CLS.IsMthd("weeksOdbcToLogical"):tImporter.%GetData(9),1:tMe.weeksOdbcToLogical(tImporter.%GetData(9)))
					set tMe.rank = $s('$system.CLS.IsMthd("rankOdbcToLogical"):tImporter.%GetData(10),1:tMe.rankOdbcToLogical(tImporter.%GetData(10)))
					set tMe.change = $s('$system.CLS.IsMthd("changeOdbcToLogical"):tImporter.%GetData(11),1:tMe.changeOdbcToLogical(tImporter.%GetData(11)))
					set tMe.spotifylink = $s('$system.CLS.IsMthd("spotifylinkOdbcToLogical"):tImporter.%GetData(12),1:tMe.spotifylinkOdbcToLogical(tImporter.%GetData(12)))
					set tMe.spotifyid = $s('$system.CLS.IsMthd("spotifyidOdbcToLogical"):tImporter.%GetData(13),1:tMe.spotifyidOdbcToLogical(tImporter.%GetData(13)))
					set tMe.videolink = $s('$system.CLS.IsMthd("videolinkOdbcToLogical"):tImporter.%GetData(14),1:tMe.videolinkOdbcToLogical(tImporter.%GetData(14)))
					set tMe.genre = $s('$system.CLS.IsMthd("genreOdbcToLogical"):tImporter.%GetData(15),1:tMe.genreOdbcToLogical(tImporter.%GetData(15)))
					set tMe.broadgenre = $s('$system.CLS.IsMthd("broadgenreOdbcToLogical"):tImporter.%GetData(16),1:tMe.broadgenreOdbcToLogical(tImporter.%GetData(16)))
					set tMe.analysisurl = $s('$system.CLS.IsMthd("analysisurlOdbcToLogical"):tImporter.%GetData(17),1:tMe.analysisurlOdbcToLogical(tImporter.%GetData(17)))
					set tMe.energy = $s('$system.CLS.IsMthd("energyOdbcToLogical"):tImporter.%GetData(18),1:tMe.energyOdbcToLogical(tImporter.%GetData(18)))
					set tMe.liveness = $s('$system.CLS.IsMthd("livenessOdbcToLogical"):tImporter.%GetData(19),1:tMe.livenessOdbcToLogical(tImporter.%GetData(19)))
					set tMe.tempo = $s('$system.CLS.IsMthd("tempoOdbcToLogical"):tImporter.%GetData(20),1:tMe.tempoOdbcToLogical(tImporter.%GetData(20)))
					set tMe.speechiness = $s('$system.CLS.IsMthd("speechinessOdbcToLogical"):tImporter.%GetData(21),1:tMe.speechinessOdbcToLogical(tImporter.%GetData(21)))
					set tMe.acousticness = $s('$system.CLS.IsMthd("acousticnessOdbcToLogical"):tImporter.%GetData(22),1:tMe.acousticnessOdbcToLogical(tImporter.%GetData(22)))
					set tMe.instrumentalness = $s('$system.CLS.IsMthd("instrumentalnessOdbcToLogical"):tImporter.%GetData(23),1:tMe.instrumentalnessOdbcToLogical(tImporter.%GetData(23)))
					set tMe.timesignature = $s('$system.CLS.IsMthd("timesignatureOdbcToLogical"):tImporter.%GetData(24),1:tMe.timesignatureOdbcToLogical(tImporter.%GetData(24)))
					set tMe.danceability = $s('$system.CLS.IsMthd("danceabilityOdbcToLogical"):tImporter.%GetData(25),1:tMe.danceabilityOdbcToLogical(tImporter.%GetData(25)))
					set tMe.key = $s('$system.CLS.IsMthd("keyOdbcToLogical"):tImporter.%GetData(26),1:tMe.keyOdbcToLogical(tImporter.%GetData(26)))
					set tMe.durationms = $s('$system.CLS.IsMthd("durationmsOdbcToLogical"):tImporter.%GetData(27),1:tMe.durationmsOdbcToLogical(tImporter.%GetData(27)))
					set tMe.loudness = $s('$system.CLS.IsMthd("loudnessOdbcToLogical"):tImporter.%GetData(28),1:tMe.loudnessOdbcToLogical(tImporter.%GetData(28)))
					set tMe.valence = $s('$system.CLS.IsMthd("valenceOdbcToLogical"):tImporter.%GetData(29),1:tMe.valenceOdbcToLogical(tImporter.%GetData(29)))
					set tMe.mode = $s('$system.CLS.IsMthd("modeOdbcToLogical"):tImporter.%GetData(30),1:tMe.modeOdbcToLogical(tImporter.%GetData(30)))
					set tMe.lyrics = $s('$system.CLS.IsMthd("lyricsOdbcToLogical"):tImporter.%GetData(31),1:tMe.lyricsOdbcToLogical(tImporter.%GetData(31)))
				}
				elseif pSelectMode = 2 {
					set tMe.date = $s('$system.CLS.IsMthd("dateDisplayToLogical"):tImporter.%GetData(1),1:tMe.dateDisplayToLogical(tImporter.%GetData(1)))
					set tMe.year = $s('$system.CLS.IsMthd("yearDisplayToLogical"):tImporter.%GetData(2),1:tMe.yearDisplayToLogical(tImporter.%GetData(2)))
					set tMe.title = $s('$system.CLS.IsMthd("titleDisplayToLogical"):tImporter.%GetData(3),1:tMe.titleDisplayToLogical(tImporter.%GetData(3)))
					set tMe.simpletitle = $s('$system.CLS.IsMthd("simpletitleDisplayToLogical"):tImporter.%GetData(4),1:tMe.simpletitleDisplayToLogical(tImporter.%GetData(4)))
					set tMe.artist = $s('$system.CLS.IsMthd("artistDisplayToLogical"):tImporter.%GetData(5),1:tMe.artistDisplayToLogical(tImporter.%GetData(5)))
					set tMe.mainartist = $s('$system.CLS.IsMthd("mainartistDisplayToLogical"):tImporter.%GetData(6),1:tMe.mainartistDisplayToLogical(tImporter.%GetData(6)))
					set tMe.peakpos = $s('$system.CLS.IsMthd("peakposDisplayToLogical"):tImporter.%GetData(7),1:tMe.peakposDisplayToLogical(tImporter.%GetData(7)))
					set tMe.lastpos = $s('$system.CLS.IsMthd("lastposDisplayToLogical"):tImporter.%GetData(8),1:tMe.lastposDisplayToLogical(tImporter.%GetData(8)))
					set tMe.weeks = $s('$system.CLS.IsMthd("weeksDisplayToLogical"):tImporter.%GetData(9),1:tMe.weeksDisplayToLogical(tImporter.%GetData(9)))
					set tMe.rank = $s('$system.CLS.IsMthd("rankDisplayToLogical"):tImporter.%GetData(10),1:tMe.rankDisplayToLogical(tImporter.%GetData(10)))
					set tMe.change = $s('$system.CLS.IsMthd("changeDisplayToLogical"):tImporter.%GetData(11),1:tMe.changeDisplayToLogical(tImporter.%GetData(11)))
					set tMe.spotifylink = $s('$system.CLS.IsMthd("spotifylinkDisplayToLogical"):tImporter.%GetData(12),1:tMe.spotifylinkDisplayToLogical(tImporter.%GetData(12)))
					set tMe.spotifyid = $s('$system.CLS.IsMthd("spotifyidDisplayToLogical"):tImporter.%GetData(13),1:tMe.spotifyidDisplayToLogical(tImporter.%GetData(13)))
					set tMe.videolink = $s('$system.CLS.IsMthd("videolinkDisplayToLogical"):tImporter.%GetData(14),1:tMe.videolinkDisplayToLogical(tImporter.%GetData(14)))
					set tMe.genre = $s('$system.CLS.IsMthd("genreDisplayToLogical"):tImporter.%GetData(15),1:tMe.genreDisplayToLogical(tImporter.%GetData(15)))
					set tMe.broadgenre = $s('$system.CLS.IsMthd("broadgenreDisplayToLogical"):tImporter.%GetData(16),1:tMe.broadgenreDisplayToLogical(tImporter.%GetData(16)))
					set tMe.analysisurl = $s('$system.CLS.IsMthd("analysisurlDisplayToLogical"):tImporter.%GetData(17),1:tMe.analysisurlDisplayToLogical(tImporter.%GetData(17)))
					set tMe.energy = $s('$system.CLS.IsMthd("energyDisplayToLogical"):tImporter.%GetData(18),1:tMe.energyDisplayToLogical(tImporter.%GetData(18)))
					set tMe.liveness = $s('$system.CLS.IsMthd("livenessDisplayToLogical"):tImporter.%GetData(19),1:tMe.livenessDisplayToLogical(tImporter.%GetData(19)))
					set tMe.tempo = $s('$system.CLS.IsMthd("tempoDisplayToLogical"):tImporter.%GetData(20),1:tMe.tempoDisplayToLogical(tImporter.%GetData(20)))
					set tMe.speechiness = $s('$system.CLS.IsMthd("speechinessDisplayToLogical"):tImporter.%GetData(21),1:tMe.speechinessDisplayToLogical(tImporter.%GetData(21)))
					set tMe.acousticness = $s('$system.CLS.IsMthd("acousticnessDisplayToLogical"):tImporter.%GetData(22),1:tMe.acousticnessDisplayToLogical(tImporter.%GetData(22)))
					set tMe.instrumentalness = $s('$system.CLS.IsMthd("instrumentalnessDisplayToLogical"):tImporter.%GetData(23),1:tMe.instrumentalnessDisplayToLogical(tImporter.%GetData(23)))
					set tMe.timesignature = $s('$system.CLS.IsMthd("timesignatureDisplayToLogical"):tImporter.%GetData(24),1:tMe.timesignatureDisplayToLogical(tImporter.%GetData(24)))
					set tMe.danceability = $s('$system.CLS.IsMthd("danceabilityDisplayToLogical"):tImporter.%GetData(25),1:tMe.danceabilityDisplayToLogical(tImporter.%GetData(25)))
					set tMe.key = $s('$system.CLS.IsMthd("keyDisplayToLogical"):tImporter.%GetData(26),1:tMe.keyDisplayToLogical(tImporter.%GetData(26)))
					set tMe.durationms = $s('$system.CLS.IsMthd("durationmsDisplayToLogical"):tImporter.%GetData(27),1:tMe.durationmsDisplayToLogical(tImporter.%GetData(27)))
					set tMe.loudness = $s('$system.CLS.IsMthd("loudnessDisplayToLogical"):tImporter.%GetData(28),1:tMe.loudnessDisplayToLogical(tImporter.%GetData(28)))
					set tMe.valence = $s('$system.CLS.IsMthd("valenceDisplayToLogical"):tImporter.%GetData(29),1:tMe.valenceDisplayToLogical(tImporter.%GetData(29)))
					set tMe.mode = $s('$system.CLS.IsMthd("modeDisplayToLogical"):tImporter.%GetData(30),1:tMe.modeDisplayToLogical(tImporter.%GetData(30)))
					set tMe.lyrics = $s('$system.CLS.IsMthd("lyricsDisplayToLogical"):tImporter.%GetData(31),1:tMe.lyricsDisplayToLogical(tImporter.%GetData(31)))
				}
				set tStatus = tMe.%Save()
				if $$$ISOK(tStatus) { set tCounter = tCounter + 1 }
			}
		}
	}
	set %sqlcontext.%SQLCODE = 0
	set %sqlcontext.%ROWCOUNT = tCounter
	set pRecordCount = tCounter
	quit tCounter
}

Parameter ROWTYPE = """date"" VARCHAR(250),""year"" VARCHAR(250),""title"" VARCHAR(250),""simple_title"" VARCHAR(250),""artist"" VARCHAR(250),""main_artist"" VARCHAR(250),""peak_pos"" VARCHAR(250),""last_pos"" VARCHAR(250),""weeks"" VARCHAR(250),""rank"" VARCHAR(250),""change"" VARCHAR(250),""spotify_link"" VARCHAR(250),""spotify_id"" VARCHAR(250),""video_link"" VARCHAR(250),""genre"" VARCHAR(250),""broad_genre"" VARCHAR(250),""analysis_url"" VARCHAR(250),""energy"" MONEY,""liveness"" MONEY,""tempo"" MONEY,""speechiness"" MONEY,""acousticness"" MONEY,""instrumentalness"" MONEY,""time_signature"" VARCHAR(250),""danceability"" MONEY,""key"" VARCHAR(250),""duration_ms"" VARCHAR(250),""loudness"" MONEY,""valence"" MONEY,""mode"" VARCHAR(250),""lyrics"" VARCHAR(250)";

Storage Default
{
<Data name="PopSongsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>date</Value>
</Value>
<Value name="3">
<Value>year</Value>
</Value>
<Value name="4">
<Value>title</Value>
</Value>
<Value name="5">
<Value>simpletitle</Value>
</Value>
<Value name="6">
<Value>artist</Value>
</Value>
<Value name="7">
<Value>mainartist</Value>
</Value>
<Value name="8">
<Value>peakpos</Value>
</Value>
<Value name="9">
<Value>lastpos</Value>
</Value>
<Value name="10">
<Value>weeks</Value>
</Value>
<Value name="11">
<Value>rank</Value>
</Value>
<Value name="12">
<Value>change</Value>
</Value>
<Value name="13">
<Value>spotifylink</Value>
</Value>
<Value name="14">
<Value>spotifyid</Value>
</Value>
<Value name="15">
<Value>videolink</Value>
</Value>
<Value name="16">
<Value>genre</Value>
</Value>
<Value name="17">
<Value>broadgenre</Value>
</Value>
<Value name="18">
<Value>analysisurl</Value>
</Value>
<Value name="19">
<Value>energy</Value>
</Value>
<Value name="20">
<Value>liveness</Value>
</Value>
<Value name="21">
<Value>tempo</Value>
</Value>
<Value name="22">
<Value>speechiness</Value>
</Value>
<Value name="23">
<Value>acousticness</Value>
</Value>
<Value name="24">
<Value>instrumentalness</Value>
</Value>
<Value name="25">
<Value>timesignature</Value>
</Value>
<Value name="26">
<Value>danceability</Value>
</Value>
<Value name="27">
<Value>key</Value>
</Value>
<Value name="28">
<Value>durationms</Value>
</Value>
<Value name="29">
<Value>loudness</Value>
</Value>
<Value name="30">
<Value>valence</Value>
</Value>
<Value name="31">
<Value>mode</Value>
</Value>
<Value name="32">
<Value>lyrics</Value>
</Value>
</Data>
<DataLocation>^dc.bi.PopSongsD</DataLocation>
<DefaultData>PopSongsDefaultData</DefaultData>
<IdLocation>^dc.bi.PopSongsD</IdLocation>
<IndexLocation>^dc.bi.PopSongsI</IndexLocation>
<StreamLocation>^dc.bi.PopSongsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
