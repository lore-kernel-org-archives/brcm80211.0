Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246273;
	b=ZQHlGrxBejucoaWJI0v4sl+oejS7LXUb+HtzRYwn2p2EnmpZkKVDYVN95sOAO4RHqZ6N
	 cA5BT3U/teE7sTIFQkSEuZFrEqUdpbtAOtpgARJ+ULdjCUI0fJ/04ioK5QJgKRyVTlLj+
	 CcZwPvLVfJjEyVFE/wAqqswtolU/UTLiGRL6Z1NokHXInx3RCoht/LEgyL+PgKFfuDlML
	 wqhGk4j8I8B+kB2+JFl9GojPoLrllX/VFQgnRMtZpHn1oxRAySrcRTPLlcoAlYUyhfNDn
	 wICEr0IRcAbuLgbgSIUCH1E3OMwidbp2AlFM6XwRx9oWstgDLspYJa/9MBD6NH0OkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
	b=spvcDfRo8n5inU/7cuj9UHwYGakjGMhHCrECwgJQ9G0nOe/zUnhvB7mCauBZ/Chn5mLm
	 JSP9KhO5yQMejW3lMkQ1lPBjaqQb45OWae6sqBioXZGQw6LeBNSN3PABDq61J+Bm/ytHU
	 OUQIX8j/rO+4rM85ibc6nmHidvOSgxK/7xZ3zrwAXT6pG5VWIufI/l1gM818DqumcOtW/
	 hUvlfUvg272wK0F1VTw7q/c3fLRaGfhZJvjXYbOnFd1jSME7vP1OwQKDjDlt/ZJ0YigF5
	 Q5rFF2dMiyVrqqhkKTbMZSJdI9xYJ5sEuZWC0OcTA6k11ZQ/j2+SpVsaOzk8wMTEf3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RodyvSxc;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C4606A325
	for <brcm80211@lists.linux.dev>; Mon,  9 Nov 2026 17:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31C4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RodyvSxc
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1351322a12.2
        for <brcm80211@lists.linux.dev>; Mon, 09 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246271; x=1794851071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
        b=RodyvSxcOn4azfQK7rTzWXsD046aX/MYjxgklT6jWdmSpXGYg7eOXt1TFEWLEiKcUZ
         enUeEYIEKP8vhyQOuQX+oJQf9AYeL6Tj0WUzcqoMd6hvZSjdL/Z0Ukb5yZRPUz1sDoFE
         u3nPevf7PryB6Wi2gKqv2hfyxGxM6bOMFyFcXglDtd/zQkp9H14c5/+rNUVv0RtkdUMu
         VBMadoi/98ZcfDNw75QKvU4hA7Gu6hvbCTW8y5TX3vH8KjBUWMtetbeEW0BSAYmsrPdy
         Tf5XtkeuQAR7Bsz4qeuZpf5BGaRnp+mr938Rqyw30iACh7jp3nvcVtAzjk19BK2C37s0
         hgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246271; x=1794851071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
        b=ptCfCRVW1QBLw506R2rypIdEyT3Hr7y5t6S6PZjTYHQIE+XH82yAJJZmZHcKQjuNRE
         tfylRg+d7kUBpKcXHKWbRrTfAkr2+yzkvpoeJ9wMRtI14qn1PkAddYPxdbGo9z3d/fhI
         nyFKIfeacc10HCowcQeuIRycLaJbbDbZzy2UwPmomXcRFaissOfavpFOhNy5YWsU7AzQ
         SPYIiHM8N7Ig7TQS3ixGwdy+8kt3teqIFKfF5TnHI/Q/9yQU5JjfxuMAUueNuMQLnO3L
         ismX5Nfu+ttHB/yau3pErOiGpxO3Avq3s4454yXs2BmTmz3kGGo6fsLGn5VmPL2Ly5TK
         L1jg==
X-Forwarded-Encrypted: i=1; AL+hErGYi+k9vts2eemaDGNfTn6mu5Sm+ra0PbCFiO4axgyp48XwJI8FjLP8xIYUiJkfD4ID6UsuiVcnAIY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/3BJVyxmw8CiWI07IgAzFyb0udgVR9WBpacqPe41rQRTRccHhT
	3lgJfMzTLvXBAOvUoDDYEbfdSS3HuUeEaqKU3T7ft9qL0xOGeZH61KO4
X-Gm-Gg: AYBFou2cf6RPXxZsb+LNEqHVcdreUbQ+2WecGJ7mgKUK2NMiuoDeHZBoydiAgzzJZ/8
	bjUGOKWkbpn9Bni/4HupXkwoi38Tpo1rIPWwF4MbmpTEyc7Blow4KJS3TE2IwKKXJST5a0fXLp1
	UItMpjrmrghO8Ptr9c/jkFVlmdBC31+Y57p7Pr/DDzTDtde6c0R7kwBNO92DVYuSbPCBdruptGN
	4Pgmhi9PpCRPOEqE3/LoKJSzKSoUQ94NS2j/ZVCFlnnnQC1zaath1wy1kQgiY6QZkrVNwFCZtUK
	XrjX/8pa9j/lKo10DQ3afpNDibmBVW3Qwj/gangYbpMFIii8nd+6nDk3MvxgN8wHclZMATrcTOZ
	Ba9+PHwBG3oxCZ+ByIPIZCirXosiVhBYzdr8QJJLYTJYbie3V9iecGWZbep6k4DygByrivsxowV
	s4i3ahmsGg5wh5QoMkQUjByQKVJ86v3CllVf2aWiyFRn+uG9YM4OvZ6W1CjQBVFN1JPAPeDGMK5
	a21zUx5BvHjpiaNbJWDf0Jf4bDgsL7jGw4MkzsUJzTOlTOlepTC8h1rwG+w3vhdzv4xkFF6P0Mp
	YNi9HddE0uxpRhbYexnNZG+9ksaSsnCPNFbH0KQYoZRsSfB/9IMgu8PncYKu9WFcLcIq2w==
X-Received: by 2002:a05:6402:360f:b0:6b1:ce0f:eb6b with SMTP id 4fb4d7f45d1cf-6b756aea03fmr291538a12.31.1794246271039;
        Mon, 09 Nov 2026 09:44:31 -0800 (PST)
Received: from localhost.localdomain ([80.248.138.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721e3c8bfsm1902499a12.3.2026.11.09.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:44:30 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Mon,  9 Nov 2026 18:44:10 +0100
Message-ID: <20261109174410.1530720-1-kudzo51@gmail.com>
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

