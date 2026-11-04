Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811872;
	b=nOpcLiw1aKdR/xscgmyPqcBpwJwzYDH4EyJskmOeSdB6ss43Pld+Zj7VVfNJ7Bn4RYbe
	 E/+9eWUO82ZLE0nlxFKPBX98agRmdLXdLg3MS1YYwb0yhZNz1Rq8+kdxRphDfDA5NjPqQ
	 HrbRewhHlcsUeK4K8SuYkpYFyU7/GW3STMzYhj4jEun3RYNrPf6KqqxuFLeRYj3oOpolJ
	 kp3m8z8CrTz+H1cn7Qfor5rL+Ow/3exWXe2qMHsL0AgFMzj6g/fqXbFEvh7zugG9Jcwmg
	 0v7tIZXshG/2f56pjVxUXafg+Km/LcWfF1JfO7hBpw4MOd1wn8FQLoL94ScwoTVNPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
	b=th9kzQfOlXJau5CB+nW/DufPHHTnAxrNxC8+k+wFn2U0CUE3S0X0z56YQo8go5Ug+5Wz
	 3oZhrA9XkM5ZJgWC9D7F5iwBJnBbpIVWhn4DGHPEZNtjDl5rE5OFNadAJN6Yt/cPolkhK
	 yf0hn6HhsyPFfDBbDs48AOpg3K8bXlN/gS0auPgstUCK02Qyvecp1+PiMSPvv08VB1y71
	 OJiTLAkOZUEvo4RtDrwm2A7MJ57hYcAy+ccmI1D1SvZS70kxOsSKfwQRyIBQY7/LFm7C1
	 WqIZ6rlmu1uYYQsXUBVyq5aHfpJf1bBcWziLa5VGeLP4qqmec7C3vAZVAEr/h2DC4Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ts4yxYSO;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5A606A329
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D5A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ts4yxYSO
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so686767f8f.3
        for <brcm80211@lists.linux.dev>; Wed, 04 Nov 2026 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811870; x=1794416670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
        b=Ts4yxYSOHB0LdLBex1NkMNGdaIJE4rzGUY3D0FD+L8B18ZRAUmDdsQqYxYMcepWJ0x
         fCQGZkW0silVdU3fOEqQWfEtghRB/O1VU5Hqrdzq2sZfYWDJWpn5CDpPSsvUUcYTwW6b
         bIE1nWHq8B6P65GYWVzwPSdlC5f9OrQEHGr0kckeAF9JRExuaXv0gAV3I2fRIt4Rs0s1
         U8Cy4nLS4NzfglwrNHzMV8vDQu49WS94nQ4MEt1VFMcVsi+Ew2wTy5evpIhKMorEAcR9
         xq9WbiQsI+d77HxJLqSm0XFKVo4BDIKUddLPkAbkzz5/f3UCU1XP34+CF0ecit+aEp14
         /toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811870; x=1794416670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8uAXRtGsSienYNkaab0cXktgUbGtmZejNsezC1QQio=;
        b=tUqUT5Bb4v4glUh/0xKeZnWh6GUOrksNl/YaRXrMM0AduJjoofDXHGedjMq2/3SFKK
         uy9jhoObpIgA8KnYhNsl74T9mIL03dwFxV2nrvGyYgyegGotmWqmpar/OVhZu3oaA+NZ
         FbyCC5sqmcNvIN3wpo4eJIMfHpYFNDb0T7WfxsSrY9c7QOEmOlwiYqkhFpLNdVlIdFk4
         h221L2xWu+yW7Y+dxaBhDQPuckxZJs0btxlwTkLokKa0xDhkUgjcdCglys7TLsW8jqaD
         Azt3+MSXS9TBd8pICTt5gmNxHUftupLaDZZYUxxcOEOQhk14p7hBUh9v2/i3EceFKIvv
         /oTA==
X-Forwarded-Encrypted: i=1; AKwUvBw0/VNx9oaiVwfqIftblg4jCmPZTZ0sbsonzaAye9YWKD9V+GEWbpZuzYjLvz0CS1Bgw3dOuvnvnXg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LTOrwKYkenrIW6P8xZ9gG3ZfOxbsKm73usW4doJeGBqXX6vnE
	+/yJkPgLh2jaLsGMoJuMJBdzjCa/u57MZlbx2hTaoNK7sm9T+2MuzV3G
X-Gm-Gg: AYBFou3U8Ij3cPwEAxAdyqgxjmHxbgDoFu1yQrnhyNJYHFx99ZIXedkeiccc9FH0A3b
	2rwUxv8LZxetRrPOWauPNmYCRQxL6rRhcDHbtZP6MXCUmEalD1ycP2igEZbhGu3Prv3IQnE6stU
	F+qQYNv38UghX67DJ2bbhwTeSkAOIjFXz5b8VqkO3TPQl8SBN2r/QxG06qA/WwOPSIeKrMXUFnK
	MiOqbA+YUMDj9EanTPGVEAUC4YOD2FXb8Tuehn8Tva3g5Rc70+baw2Rvun+h0kyVdFei991AKo6
	ltKU1J2luzXBmMA8iMNpF2IwmzTsWJfJggfNhwACQThuI5OnM5dePQiac02v5u6igUQJNqID1pF
	Tx1HQkTjSLgthv8jp+415Hhsiit3xwxrx3v3uR+qgYP7yopfixiVbvEPDCD1I1/sfiOx76jGCcS
	OAvCPFe5l2qdBCG0O8+QbaHBwswckgAo7TDQC4GPJop0D4kNmD/MqHSeqGxHMOUShZQIiTdmaaU
	bsiNvF0/UwQvawCRFPSlYC2WTW1GzqZBgA2Qdh1a/0D3pSzVgxL3s91UOxK4qrYLTzGnzaZv36k
	sKkbGUyi8r+OHldAfSmgWG9nyu7i4H1q2qSv01RFwv8qF13F7MmQHub/8MKFPN6abZMnTewjThN
	m9mrct4N0xRA=
X-Received: by 2002:adf:e19c:0:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-4900ae2b9a7mr4474785f8f.30.1793811869589;
        Wed, 04 Nov 2026 09:04:29 -0800 (PST)
Received: from User-PC.localdomain (185-80-76-65.ptr185.nosmadeira.net. [185.80.76.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm4747263f8f.10.2026.11.04.09.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:04:28 -0800 (PST)
From: Jeff Campbell <inca.jeff.campbell@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: brcmfmac: enable 2.4 GHz VHT on BCM4366 before AP bring-up
Date: Wed,  4 Nov 2026 17:04:26 +0000
Message-ID: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
X-Mailer: git-send-email 2.47.3
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

On BCM4366 firmware 10.28.2 (r769115) the 2.4 GHz radio defaults to
vht_features 6: proprietary rates and 1024-QAM on, 2.4 GHz VHT off.
brcmfmac never sets this iovar. As an AP the d11 PSM watchdog then fires
repeatedly once a client passes traffic, the client disassociates and
never completes DHCP.  This renders the radio unusable as an AP.

On an ASUS RT-AC86U (BCM43666 2.4 GHz radio), with every other bring-up
setting held fixed, values 0 and 6 fail and values 1 and 7 are stable,
so bit 0 alone decides it. The ASUS firmware for this router sets 7.

Set bit 0, keeping the other bits, on the primary 2.4 GHz BSS of the
4366 family while the radio is still down. 5 GHz is left alone: it
keeps 6 and is stable.  This stabilizes 2.4GHz AP and clients now
associate, DHCP and pass traffic at normal levels.

Signed-off-by: Jeff Campbell <inca.jeff.campbell@gmail.com>
---
Tested on an ASUS RT-AC86U, firmware 10.28.2 (r769115), AP mode, 2.4 GHz
channel 1 at 20 MHz, one client. The router runs OpenWrt on 6.12, so this
is wireless-next brcmfmac at 991a73f49 built as a module with a small
local shim for the older cfg80211 API (not part of this patch), not a
wireless-next kernel. The two builds differ only by this patch:

  with patch:    vht_features 7, three speed test runs on one association,
                 no watchdog, DHCP completes, 560/155917 tx failed
  without patch: vht_features 6, 16 PSM watchdogs in the first 102 s after
                 boot, client retries DHCP and gives up

5 GHz stays at 6 in both builds. One speed test run there was clean, with
no tx failures and no watchdog.

The chip check covers the 4366
family, but only the 43666 2.4 GHz radio on this board has been tested.

 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871..e971057fb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5253,6 +5253,36 @@ brcmf_parse_configure_security(struct brcmf_if *ifp,
 	return err;
 }
 
+#define BRCMF_VHT_FEATURES_2G_ENAB	BIT(0)
+
+static void brcmf_cfg80211_4366_2g_vht(struct brcmf_if *ifp,
+				       const struct cfg80211_chan_def *chandef)
+{
+	u32 chip = ifp->drvr->bus_if->chip;
+	u32 val, want;
+	s32 err;
+
+	if (chandef->chan->band != NL80211_BAND_2GHZ)
+		return;
+	if (chip != BRCM_CC_4366_CHIP_ID && chip != BRCM_CC_43664_CHIP_ID &&
+	    chip != BRCM_CC_43666_CHIP_ID)
+		return;
+	err = brcmf_fil_iovar_int_get(ifp, "vht_features", &val);
+	if (err < 0) {
+		brcmf_dbg(INFO, "vht_features get failed (%d)\n", err);
+		return;
+	}
+	if (val & BRCMF_VHT_FEATURES_2G_ENAB)
+		return;
+	want = val | BRCMF_VHT_FEATURES_2G_ENAB;
+	err = brcmf_fil_iovar_int_set(ifp, "vht_features", want);
+	if (err < 0)
+		bphy_err(ifp->drvr, "vht_features 2.4 GHz enable failed (%d)\n",
+			 err);
+	else
+		brcmf_dbg(INFO, "vht_features 0x%x -> 0x%x\n", val, want);
+}
+
 static s32
 brcmf_cfg80211_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 			struct cfg80211_ap_settings *settings)
@@ -5397,6 +5427,8 @@ brcmf_cfg80211_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 				goto exit;
 			}
 		}
+		if (!mbss)
+			brcmf_cfg80211_4366_2g_vht(ifp, &settings->chandef);
 		err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_UP, 1);
 		if (err < 0) {
 			bphy_err(drvr, "BRCMF_C_UP error (%d)\n", err);

base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.47.3

