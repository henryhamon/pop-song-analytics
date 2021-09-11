Class dc.script.Genre
{

ClassMethod Run()
{
	Set tSC = $$$OK
	Try {
      &sql(DECLARE songCursor CURSOR FOR
        SELECT ID as SongId
        INTO :songId FROM dc_bi.PopSongs)
      &sql(OPEN songCursor)
      QUIT:(SQLCODE'=0)
      &sql(FETCH songCursor)
      WHILE (SQLCODE = 0) {
          Continue:SQLCODE
          Set song = ##class(dc.bi.PopSongs).%OpenId(songId)
          Set list = $ListFromString($Translate($Replace(song.genre,"u'",""),"[]'",""),", ")
          Set ptr=0
        While $ListNext(list, ptr, value) {
          Set songGenre = ##class(dc.bi.SongsGenres).%New()
          Set genre = ##class(dc.bi.Genre).nameIdxOpen(value)
            If ('$IsObject(genre)) {
              Set genre = ##class(dc.bi.Genre).%New()
              Set genre.name = value
              Do genre.%Save()
            }
          Set songGenre.genre = genre
          Do song.genres.Insert(songGenre)
        }
        Do song.%Save()
        &sql(FETCH songCursor)
      }

      &sql(CLOSE songCursor)
	} Catch tException {
      Set:$$$ISOK(tSC) tSC = tException.AsStatus()
	}
	Quit tSC
}

}
