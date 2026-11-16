Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833383;
	b=iTN52PwTFCeSTZpTwIthw9VoY7sry7VNG+2WNdBNeCoWvl69C2/tLP68j/FIUoPS6xm/
	 qJv4WOwMD1ulvLfEF08RXDYQYLONQYytEqXBiO76JiVdH0/gRz3elgTPknXAhQjV7hfG/
	 x7GvRMYJHMw9qfCoHogmIO9QampXUInRb/VMZMxhIOycdwpcXth2kWe/5He/HhyCKjYup
	 U/05CIdyUcWXAlDKzcbWE1C5Z12EkeM9vXtNRpDe5a9ZMKLbx36xlhtIOA/E6ndFrW2/u
	 QVZ0ktDJ8SIWcZrQM3Gv2zaIN9jZz21nLUFMqHtec2hpnE00JD5oVCYsqh1SqiIC9Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iOjXsp94ME04l5ZgdsqMTzmmF3foBeENjQDRF1pMd0E=;
	b=XpG4zW5xC7Lsd30Sasuq1n51jeUWfi262M3ifxrSBvMUg7/8MVxUmBcE2MkLe0Bn+H8v
	 Avr4HzsnbWZM6gByeu2hBgi+iJPMzGHZHUP879mdhI4hTp6MJiQZGYZJJ0pPDopJzQWjy
	 vryeFE7TegZyjoQkSo1FgCc9IiuHbyNVGb/DRL6s4wLmBUjNSg04P6S/j8OELXZtSHJTD
	 Ay1AFuRgK/9ZHFFpZLZcRuWzx6DphXC8kn4tFS8AY4kYDPCt8ahR1vV07O26lB8FKbr91
	 lKpXFyVLdnm2zyoCllFanovFjP2RxRUW40if7UAM+DT8onbUMu/ibY0XIf++/3I02sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucrwSoYl;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201F606A335
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A201F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucrwSoYl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so4819896e87.1
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 04:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833381; x=1795438181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOjXsp94ME04l5ZgdsqMTzmmF3foBeENjQDRF1pMd0E=;
        b=ucrwSoYlfaY7rwpBlA4UKGni0Fq+29PpOnOmEyJuFSSJ5QbZzH3MM/diV22VkLm7hQ
         oCHzSig7J6HKnA0ANsyq3UpPCWMjUkOtrT9wopWLsSECtZZBDXVCx+4DLkzEofl34nUA
         6uiB/yfsbthRmVykmQCcgFoqL4iPSUUJXht443nTvleXMXaarrexeYG+5hnNJzgwIdNS
         u7BiGngel/gfxuFvw0s4AtkBU0J37ZJ04Vdx+Zf4a+CotWm2MU/JxZQmDuWQ1nugCrb9
         0MoiMIH6An6vi4wwQx/Ba6uJM038Mbv9RuTCo7oeUCpBc77AMon2CjMZkToFxcJZAbr9
         3E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833381; x=1795438181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOjXsp94ME04l5ZgdsqMTzmmF3foBeENjQDRF1pMd0E=;
        b=EO3JFRKDba+YEMfF2KsK8d2LEgSeObITHGmdRKQlPQYrNm3N9KHwyroysFI3mJrcLn
         FYT6Q9DQROSlnC2SrugaSa9mQyZpUpw/TU/Qo4ZIDIkd/ltKuFjnr4UxIV7FR0/oiZWD
         fJ0K61q6a85jH+z8KIlhqfhg/kbzpxVj7UXFx5x+09hfZlk/7zSQaBi5ne4f/sm+IJKd
         D2ZDGOpkh43+h6Mr1OaR4dm7YQhkTvy/JgMIOeKXPsSfoj6/CLrLJMUkeoW5VvRrJADV
         kzNwLeY4e2LXbhEdyOrj8lat/vJZ4VECl1gAJflXAgHOextk/giWOfRKMRwpGg0HuBaN
         KeIQ==
X-Forwarded-Encrypted: i=1; AL+hErGZ6wiiWhwHx5wm9xebQj9G+sWq1pyLuVU9eJVTOpLYKDoY3J1bpnxDmBo6eb1YQfuALG/MJCt1sjA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZMh/POW6wiZDc6pop/8izKmXZMOWuDJCNsv1FuJpWEasSkkkR
	nNvJpgPipKFAKfp6xgMQgEYiqrNExCoANbB/aGOyMjCl4WpAI0y4ge/G
X-Gm-Gg: AYBFou3iJRCIaUuf71jVgHQ7y02rTAxf4mjHHbb0EW1U06NICqaGD6b/8bqOoyGwte+
	CXgcEpId566B+EPyaGn+bW5qBRRxDDFvzqUoPB5xMLzU7C84HG7kJGTvLy7EIH0ItNJDl2pAicg
	yEWb2hU/mX5p2w/S7Dg2gIHhi9z4KUsv+2Oyu9+q5PXizuUnuKPyYvxDKtG3tpA2QEfzL7GzFTU
	8qm01he8btBiVIfWHXmOIZ3rC1+ZIhn+hGCtohqeHGdOruXjzBc1TMej7rkvzvQardi6g+xqK5D
	0Q54BYdGBJQNOC7eb3IYBSvlJ6S+Z1SMuBFEJATC8Zme7slLgzMnswFBNkzn1d7ecobgAebWl4v
	zxWsc1IBCXNW5d7Z75lvMPGJEPQHwp896ok506vIpr0gQHuim1TvkUECgEv/WuFPCnvvgUJk/Lh
	rI7X0T4TQS5H4yvVRdGQ+EeiBehxq+Ly2ERN/fPjc64zVetl47EqduJKytSqkhk+Ufm6+3JYsS5
	jmcK/dHTfbKe9TbKijSZuk3HXNPWPdfJOGxmdsJTwiYMjQ54YGfM9pAr/qV5Rw/cEWN7VtAXsit
	ndgp3WW+pHvg8/O0SUhFLW23GlkYWtki5z/kc0PqmQ==
X-Received: by 2002:a05:6512:b91:b0:5c1:595f:2a6e with SMTP id 2adb3069b0e04-5c1709c9e08mr3973809e87.30.1794833380394;
        Mon, 16 Nov 2026 04:49:40 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135658csm3197739e87.69.2026.11.16.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:49:39 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Mon, 16 Nov 2026 13:49:35 +0100
Message-ID: <20261116124935.685189-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An access point has a flowring for each station and access category,
and one for its broadcast and multicast frames. The rings of a station
are deleted when it leaves, by brcmf_proto_delete_peer() with its
address. Stopping the AP deletes none of them, and neither does a
link-down event: delete_peer then gets the address of the event, which
names no station; on a BCM43684 it is the BSSID of the AP. When the
interface is started again as an AP, it keeps the old broadcast ring.

Seen with a BCM43684 whose AP was stopped and started again at boot:
the firmware no longer read the broadcast ring in use when the first
start ended. The broadcasts of that BSS, ARP included, stayed in the
ring, and once it was full flow control stopped the interface for all
of its stations, until the ring was deleted hours later by a change of
the interface type; the firmware then served new rings normally. The
vendor driver deletes all the rings of an interface on a link-down
event.

Do the same, and delete them in brcmf_cfg80211_stop_ap() after
BRCMF_C_DOWN: brcmf_flowring_delete_peer() without a peer now deletes
every ring of the interface.

Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---

Notes:
    v2:
    - the call in brcmf_cfg80211_stop_ap() now comes after BRCMF_C_DOWN,
      in both branches (Arend): before it, a broadcast could open a new
      ring between the delete and BRCMF_C_DOWN
    - commit message: rings per station and access category, what the
      address of the link-down event names, and the restart at boot
      without a guess at its cause
    v1: https://lore.kernel.org/all/20261110231145.206744-1-kudzo51@gmail.com/
    
    Arend, you suggested this or dropping the call and relying on the
    link-down event. I kept the call so that the stop does not depend on
    the event: on my BCM43684 it comes with reason 4 (BSS disabled),
    possibly from the empty SET_SSID rather than from BRCMF_C_DOWN, and
    the mbss branch sends only BRCMF_C_DOWN.
    
    The mainline driver does not run my BCM43684 (it needs the BCA host
    interface, about 60 patches that are not upstream), so this patch is
    compile-tested only. In my tree, with the variants behind module
    parameters, I stopped and started a BCM43684 access point 45 times
    with hostapd_cli disable and enable while 500 or 2000 broadcasts a
    second went to it:
    - without the patch the broadcast ring outlived the stop (7 of 7), and
      after the first restart in each of the 3 runs without the patch the
      firmware did not read it again: the ring stayed full and its read
      pointer did not move
    - stopping the AP brought a link-down event (reason 4, BSS disabled)
      at every stop, before the carrier went off; its address was the
      BSSID at each of the 25 stops where I logged it
    - with the call before BRCMF_C_DOWN, as in v1, a broadcast asked for a
      new ring before BRCMF_C_DOWN at 2 of 5 stops; in one of them the
      ring opened, and only the link-down event deleted it
    - after BRCMF_C_DOWN no ring opened: the firmware refused all 29 it
      answered in that time
    - with the call after BRCMF_C_DOWN no ring was left (17 stops), also
      with the link-down handling turned off, and the firmware read the
      new broadcast ring after each of the 10 starts where I checked
    - my tree has a lock around the ring table and mainline has none;
      there brcmf_msgbuf_delete_flowring() marks the ring RING_CLOSING
      before it waits, so the second caller normally skips it, but the
      check and the mark are not atomic and the table is read without a
      lock, as for any delete_peer call today
    - the mbss branch and a P2P GO were not tested: my tree takes down an
      extra BSS with the "bss" iovar
    - the vendor driver also opens no new ring while the link of the
      interface is down; this patch does not, and in my test the firmware
      refused such rings itself
    - under that load the delete of the broadcast ring timed out waiting
      for tx status 20 times out of 35; in mainline that leaves the tx
      status counter of the ring wrong, which "msgbuf: count tx status
      only for the current flowring" fixes:
      https://lore.kernel.org/all/20261112175754.396469-1-kudzo51@gmail.com/

 .../broadcom/brcm80211/brcmfmac/cfg80211.c        | 15 ++++++++++++++-
 .../broadcom/brcm80211/brcmfmac/flowring.c        |  5 +++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b0eaf9641..d5b0a0770 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5492,6 +5492,8 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 
 		if (ifp->vif->mbss) {
 			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_DOWN, 1);
+			/* the BSS goes away, and so do all of its rings */
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
 			return err;
 		}
 
@@ -5507,6 +5509,10 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 		err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_DOWN, 1);
 		if (err < 0)
 			bphy_err(drvr, "BRCMF_C_DOWN error %d\n", err);
+		/* the BSS goes away, and so do all of its rings: no station
+		 * deletes the one for broadcast and multicast frames
+		 */
+		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
 		err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_AP, 0);
 		if (err < 0)
 			bphy_err(drvr, "setting AP mode failed %d\n", err);
@@ -6750,7 +6756,14 @@ brcmf_notify_connect_status(struct brcmf_if *ifp,
 	    (e->event_code == BRCMF_E_DEAUTH_IND) ||
 	    (e->event_code == BRCMF_E_DISASSOC_IND) ||
 	    ((e->event_code == BRCMF_E_LINK) && (!e->flags))) {
-		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, (u8 *)e->addr);
+		/* the address of a link event of an AP names no station:
+		 * the BSS is down, and so are all of its rings
+		 */
+		if (e->event_code == BRCMF_E_LINK && brcmf_is_apmode(ifp->vif))
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+		else
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx,
+						(u8 *)e->addr);
 	}
 
 	if (brcmf_is_apmode(ifp->vif)) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
index 35cbcea0a..b9570d638 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
@@ -432,9 +432,10 @@ void brcmf_flowring_delete_peer(struct brcmf_flowring *flow, int ifidx,
 	u16 flowid;
 	bool sta;
 
-	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT);
+	/* without a peer: every ring of the interface */
+	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT) || !peer;
 
-	search = flow->tdls_entry;
+	search = peer ? flow->tdls_entry : NULL;
 	prev = NULL;
 	while (search) {
 		if (memcmp(search->mac, peer, ETH_ALEN) == 0) {

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.1

