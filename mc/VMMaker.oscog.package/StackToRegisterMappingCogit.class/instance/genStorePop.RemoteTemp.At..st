bytecode generator support
genStorePop: popBoolean RemoteTemp: slotIndex At: remoteTempIndex
	<inline: false>
	^ self genStorePop: popBoolean RemoteTemp: slotIndex At: remoteTempIndex needsStoreCheck: self ssTopNeedsStoreCheck