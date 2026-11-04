Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805394;
	b=B3dz51xF6l5pjOkollJieFRUR7T7CRig4xidEQ9XDKR6Od6I/f6Hx8/BoyR9+msmVsVq
	 w6mP0aJCMEBIDhcZrGCfIgzgMSPLwFE3Ma+6YCjSUdAimFiOTaUuGojEyL3R6uznLJwGI
	 435HbgC6ePilrFqXuiJhyp+/janbvTuGZ022bFyFgQubV2Ga2wwd59aS7fEAW1TfXQXtR
	 cE1dGI/iI8yLbr/zLKFmPkz3FlV/a9bjuW2QX8NkX6MjdLCImrp1w0IvU3fgnlX1N5lGM
	 6DJcb7h8DuS7bVAR8nZGxgc3oqJMEKkg85RC5PDZ8CVsSAxyBGV0C66ShCbwNHI9LZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805394;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HUv3aonTMOVsk8qMfoC0IbbTBHPuVDViUYD2TXVBWn4=;
	b=sWcpHMlh7JL0bTUzP0DKyiEJ5kxPo2iVHcNijFw2sgkRqDzXKgHh8gCyQt/1vTWm88ml
	 +RfnsL1E7S9sfLV/x87AMSZS8FNVPpoo0hKxO8t12VlIYl1fQ8teNUOiWLRNZ+BjXucJN
	 yrMDFpODvPRP7LuZp0mNwdo4rhXUU0Rar39xZ4codkwLVB+MiYhoUdvflGsBiygo3mcAm
	 laDpkpb0BL5ls6gQg2ed+JEPY9zFb0G7/U8LcS7qmmMAV0MOd23TorPAtnVYL6TwoWgxb
	 KP4uSaIKmXx8Shu84kXilvLdTzMUW8EJTlM7hGl0QYPZUjC1NJHu05F6a5St2ML81Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IZmpUEBE;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299860A5BFE
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 15:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D299860A5BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IZmpUEBE
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 8235dade-8040-48b1-a247-fa48c184aae2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805392;
	bh=cZFQiaUWCwTwbQ5cpntohWw8f+YGs8832d0mnDdIQ9U=;
	h=From:To:Cc:Subject:Date:From;
	b=IZmpUEBE3jPNfx5um1SWcsxAwW8F9klf4/ahjxJ/X6amEBsc4fOYTPz2VD7eK/ikk
	 jMtWGReU6FIsAGyL0NFYtkeiEA8EB7nYynPhjMbEh0Yqx60Yaizc4aK/1e3RHjeJLD
	 RRcrGEigVfRdv9nAPD4UCZJ7RoUbJTugBP/seOYJdjEglmJbp2g+Qwluh0xIX6tBOu
	 HfbpaPppQ/kZkJKBGfGgCAPJqP5QoFS0xcXgIx2oZiHTJ1zjMU0uKu0GPESzDEGNS4
	 3nxFt00uTYQ5Sj9hav5kqo8y4W0ipIjZq0UHcs6vbd82oaOceXMKlfO4R0fzdqSpA+
	 fVFxtnfhj4ZlA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Wed,  4 Nov 2026 16:16:29 +0100
Message-ID: <20261104151629.70790-1-dev@deq.rocks>
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

The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
then pass the PSK to the driver and leave the AP side of the 4-way
handshake to the firmware. On the BCM4364 that handshake never
completes. The client associates, no EAPOL-Key frame is sent, and the
firmware removes the station after about 8 s.

Measured on a MacBookPro15,1 (BCM4364/3, firmware 9.30.514.0.32.5.94,
FWID 01-47278712) with a WPA2-PSK access point and a Samsung Galaxy
S22 Ultra as client:

  offload advertised:  NEW_STATION, DEL_STATION 7.8 s later, no EAPOL
  offload not advertised: 4-way handshake by wpa_supplicant completes,
                          AP-STA-CONNECTED, DHCP lease, traffic flows

Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
runs the handshake.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
The KaiT2en community runs this patch with its kernels, no regression
was reported.

 .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index 488364e..05e9750 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
 					BIT(BRCMF_FEAT_WOWL_GTK);
 		}
 	}
+	/* The Apple firmware for these chips lists "idauth", but in AP mode
+	 * its authenticator never completes the 4-way handshake and the
+	 * station is dropped after about 8 s. Leave the handshake to the host.
+	 */
+	switch (drvr->bus_if->chip) {
+	case BRCM_CC_4355_CHIP_ID:
+	case BRCM_CC_4364_CHIP_ID:
+	case BRCM_CC_4377_CHIP_ID:
+		ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
+		break;
+	default:
+		break;
+	}
+
 	/* MBSS does not work for all chips */
 	switch (drvr->bus_if->chip) {
 	case BRCM_CC_4330_CHIP_ID:
-- 
2.56.0

