# Using WEP with wpa\_supplicant

The linux community can be a dick sometimes. Making snark remarks instead of answering objectively. They make fun of StackOverflow but that site's users beat them at being objective with answering questions. Yes, some SO user's would show similar rude behaviour, but will almost always be shot down by someone else and with an objective answer.

A lot of people had a question like "How do we enter WEP login details on wpa\_supplicant.conf" on a Linux forum. The answers range from, "who the hell still uses WEP?" to "Simple answer, don't use WEP" and "Extend your network with a WPA capable router" while not providing any objective answer with the argument that WEP is very insecure. Some people have to deal with old technology and simply do not have the choice to use better technology, also WEP could be sufficient for what they're doing. Just as much as your bathroom doesn't need a key-lock doorknob.

It is in good service to tell people that what they could be doing is insecure. But do not leave them hanging, answer their question objectively after warning them that what they could be doing is ill-advised depending on the use-case.

So without further ado:

    network={
      ssid="wep-network-name"
      key_mgmt=NONE
      wp_key0="abcde"
      wep_tx_keyidx=0
      priority=1
    }

Where wp\_key0 is the plain-text passphrase for the router. 

tags: rpi
