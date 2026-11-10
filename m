Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352320;
	b=zpMXyWoEwsv7AsGSRJh6PZbBXcUTel4S5Jvo1izSOkrWZNjhqWW6bSzlDkKeDHlI370E
	 fmIq6Q60uFDRthdSzXZdiBxADzaUqiWCkH3DwPJrr8yP161EOFW1aHsZQTvNSgmQNTuyP
	 hlOHcdU4/jBu0x3Xo4U7gAkHnaGSITTERp6GVGi/HgjymVcPbKkWCGId9/oWYS0zFLfQ9
	 UOSdRtYw6h/mNHX6A/5xHjcRgerRMaenLfCx1OBRGy8+Manj/qrY9lsOFqsMmJNLvCPkx
	 mxEt7HHxQXOzKOwNFM9Oe1996bbut/sKpXkcr9n/j4Ft2MZi+GrneuDJG/iUzJpA0nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
	b=FAkyGty8PidgV5R7LUZrZz8c2reRDgigpl4nhTXUJULigzpj7dNkN5jvT5XJSz81USn1
	 /vTNTOFgPHLkdnTF/ChY0Dm63p0TCDUx9ovnOaLQIWKWcLxmrNzk/jTSykVYfcwQJkdzL
	 E6+GrmhqK3IhX+e1SKTt5X3sHv+v07pcrO0+qmi5oEUd8JeMJUHUfAQIVx7L+2JfZnTuX
	 795eoOnSJcV3hMjhwdbQ8V+LPddJMPBmkWumiF6b+uW5pxTCYVlg2sv3BChF1DtOO65QZ
	 hH4dL3JQ9r3zG0KhbCLuf65kkTo9R7ebI0BvNEaY/lATuRo33Gv4PZf3EDOtBnc/dCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkGY8VJf;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54457606A320
	for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 23:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54457606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkGY8VJf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40e30c26a4so393087766b.0
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 15:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352319; x=1794957119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
        b=gkGY8VJf0uijq/SCCLGd3CEcVi75EG5TwEs14KgLIYWOJJVk1zMaUbTqLDUjsF2db/
         UguJyiF7I00P7UVToe0jsYvBq1IpCAc/80no12JtzLlTGiSg8yX5RMPl9U3qxHijxHxX
         66wqlywoLOw6IW6GrHTHGBeXaHnd7WGACoOk3SBKWArP83YkzPYbMLX4KTy0xyzYqBcN
         kAS1HK5ueqhhzhICGvbOWk0m5tnb0FFOfx5fUOZFdDc8jQwW6RNx05u6LF0fDi25PUnF
         snRqtUxQH8tc/Te6yJ+R3mCi7Mdf/I8myKvX5oHdO+SpC9afqktaQoaTJzFgiw0RObfT
         DPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352319; x=1794957119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Xojv1PznqkjFmN7+yFbdkDsoaJ1qnF0z52IzXttlsY=;
        b=MzbIqO8/Vtzxa3xnO8PjyXCdZPYFR8Jvdfg4rZfoNBYA0ooAN61IQDbTqnK8fp57bq
         e64g/9fob6vuQTFpoPeOLVzm/vtLtN25dbtNXJq8RHOM6kcwxEdK64/EqTP+Gtcwgumb
         wQUM1yIaMV7A0+msqhVtZU2D/ZJVMg4mojhG+jpyVkKBrBiIVfiYL7+BCdJXLnb98m5v
         FzBBnPEkrrug4f4ox+TcSNPEJfH3kpg3pNe8YdosCxOK4JY9bgmzzu31Zrk/BHtTihBC
         KiZk9m9GWA06j6rQPjHiazyNxMBwkm8IjpFMxsz0UjQC0d2cbLYA84mC+9Xu9N2OGxNQ
         VQbg==
X-Forwarded-Encrypted: i=1; AL+hErFbl7SLnY9pdk3JGqMdQh8+8CRhKiAjIvedLRSOz8NrGWvm8f9IGigljy4ObHlKBaPsNhUvQY9RKNk=@lists.linux.dev
X-Gm-Message-State: APuU4Z80s/V06ztEBgpZc9SscqpAlOLs81MJmohFj8h64NQxcmslppeB
	f1CdMjYfjZvjsdk5bSVqxSOJ6CWvUGdZ0mTjtFZY1QWUyo4QaCbAS4EV
X-Gm-Gg: AYBFou3+Quf8w/eoKfK7ao85xPLFUfpEVzdk6Cvp6McQ7NlrN1bYxvO5XnP71Wchbn+
	r8lpzo3CbrPyYDzC1l4KyvUpnm9d02Ut2QA47YFfghX/WSjKSuwpD4IxETtF03ju+PiKNRCdf2W
	aJ1KUCACF42eyF0hOxw5mHVao+5/BDynKb4w44MtsKiKE140uTDyo2XT3hyBVf5N3wSwNwNdOcc
	aSEjLzaAQ2JQ1p8O3TR8dmm0nMXT2Ly+OZWuAD7zRrqW6XgfNKoDUQvJfMgnKM3O+xM//97+v5t
	LCXfNI6YFdxptrFRhbGDBrXQsxMfv7Gbv+/gfORvZPekyNHFHN/jK4NWaEWiYhpL9wVZNIJl642
	/ixPvWM6vWV1hxUeVN+RWbXL90IhHGdlwnHViQoJogQU8R+UB0/kRia+dZyEnCKT0gm4erLLUZ5
	N/9TSAPPnD50qZE9QX/cWV6maoGtZ87L3yqf3er5Hq3j8H3O/bEZxy1kZRptF5f3ji5pZ+cezns
	NlSOkU/5OEW4FlWU2oZkN6M+iWsnU3q+nJeLFgdI4Yez4adRO4E0euntK96k4Y30bM5sKOr+KRQ
	7YpEMlefRa3BFlHc8crrG5SznwsFvz9d/RegWNrVn3vqXg7vCdHo0h0=
X-Received: by 2002:a17:906:dc91:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c506338c761mr81873766b.9.1794352318510;
        Tue, 10 Nov 2026 15:11:58 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578ece26sm1667694a12.24.2026.11.10.15.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:11:58 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH RESEND wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Wed, 11 Nov 2026 00:11:45 +0100
Message-ID: <20261110231145.206744-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

An access point has a flowring per destination: one for each station
and one for its broadcast and multicast frames. The ring of a station is
deleted when the station leaves, by brcmf_proto_delete_peer() with its
address, but nothing deletes the broadcast ring, nor any ring of an AP
that stops: brcmf_cfg80211_stop_ap() deletes none, and on the link-down
event of an AP delete_peer gets the address of the event, which names no
station. A new start of the same interface then keeps the old rings.

Seen with a BCM43684 whose AP OpenWrt starts twice at boot, 1.2 s apart:
the firmware never read again the broadcast ring opened as the first
start ended. ARP and every other broadcast of that BSS were lost, and
once the ring was full flow control stopped the interface for all of
its stations, until the ring was deleted hours later by a change of the
interface type; the firmware then served new rings normally. The vendor
driver deletes all the rings of an interface on a link-down event.

Do the same, and when the AP stops: brcmf_flowring_delete_peer() without
a peer now deletes every ring of the interface.

Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
Resent unchanged: patchwork did not record the posting of 9 November.

 .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 14 +++++++++++++-
 .../broadcom/brcm80211/brcmfmac/flowring.c         |  5 +++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b0eaf9641..91184bdcf 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5480,6 +5480,11 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 		/* first to make sure they get processed by fw. */
 		msleep(400);
 
+		/* the BSS goes away and its rings with it: nothing else
+		 * deletes the one for broadcast and multicast frames
+		 */
+		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+
 		if (profile->use_fwauth != BIT(BRCMF_PROFILE_FWAUTH_NONE)) {
 			struct cfg80211_crypto_settings crypto = {};
 
@@ -6750,7 +6755,14 @@ brcmf_notify_connect_status(struct brcmf_if *ifp,
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
-- 
2.56.0

