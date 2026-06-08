Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB234DB72
	for <brcm80211@lists.linux.dev>; Mon,  8 Jun 2026 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896553; cv=none; b=laTEQqsr/8m2K+wO2bwI08aq6cBYKXEnoR/wsycmX7ousNyQBRqez5TVwp8ArKIQQThMdywSvO8/jm0eWmArxrVylq8jHgUGpsJ9lzQXgS3Ge3D1gZphp1w9DgNzVZS+T0Jc1g3bNeT4mh0vjssTPzV7Q4oIrvfkc5QslDLuwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896553; c=relaxed/simple;
	bh=sn1Da+qab2ghu45yZQ1NL+qe/wKBTFTs4DdzaUey6UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhRxT3kngz6un+jb2hto3R/IWEkc6PJLTu9OZcdxrCweRuAl/kmTkBiilvNnVbopvTShXqaWo0hB/Y0henNoLOK+0Zcuezp/cXpyhv5Uqk+PEt/lT9uttIqcW+U0GGgnYrdKqTyQJYqYrrZWREQRphLly0nISCcHpFyjoy+i2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqnA12Di; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqnA12Di"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c858d69bde9so1561420a12.1
        for <brcm80211@lists.linux.dev>; Sun, 07 Jun 2026 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896552; x=1781501352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTm+lQvzMCNToRs7ARjdaJ4x4SDnep7jgjKlP4xAmow=;
        b=nqnA12Di7iPOC8QexOZc8gKAQQtBwXB5fqddNmKL1pIsUks97XZ29ZI6TObofETbzt
         JmUS2nYARP1qGNXYeQkdnO/PAgx2AJiyoH7VqlbwphF4daHct68ADwDSXGa+OMR69Axc
         cUVEFsZPs7rEabmWvC88KBENkVKE25pLwjOLFFKjd2Z12swtmXWDv82ModAFQsp30pMf
         HSpHIYOOB+10cPlY8sInHrXX/kxHajJX+y9SSbZh7f7I0c77v72OyW772bqGp62C+1g5
         zcjw7DMYjmEeh9KE+UNb6tmIBHA/el4jzpzL4uxZia+NTrXZp9hRRYQl2L9dRr9UVKJm
         Berg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896552; x=1781501352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTm+lQvzMCNToRs7ARjdaJ4x4SDnep7jgjKlP4xAmow=;
        b=Mu4YiDzPHPzMEn6sPcIPB2EkIzOzCzjdBhy9hvY/rh/qjXGrjv0CXHLplXej3SaSay
         FO1CuDgstJTIFkmohmYOzQuDrtsMVfjevGp1CNzS9Kwu0j787+t629rMCo/9VDkMFAfy
         19TsfZgu76vRn1C2w8cCyfrG9KBQmF85R+Qg1Lo+dORW+jBbat93FOJW/DH5mndnAQC+
         4+v77840L6FQcLpdQZ1Dy/cu4bjW767Oe+VmRr+x+yzAovSZejdnPeT4eaFm1Leqcq22
         UDPeDCo5BvyQhOmDA+dDFEF4lnGw8k0EVvIppJRT/QgIM6UQoJBwylCcwqzO3uXxKmrc
         4NXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nlNXXei7lcqzeKn+3QZEy6jiTw1gs/9fOAMIJaJ38kRArbAl8+yzAZzA6D9qBzbHSxjPWqh6ifa8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTsB48kuRC8UIlaTH68JkykQiiM8GGfczOpaHi0cZmauONRmUj
	jCSaXJtyn58f6ofH7LNngTeJgaYUq4LygQjx+oKmHPASeFRwgBuxxR6s
X-Gm-Gg: Acq92OG9k9d7+I8arcTX0xVgO0v6AiCFbgQciiHrCuFi3Qy7zZOlYm/jBmrTCYhujCn
	bT9SGzLdOmtv8wgSQxF5d8yiNWwOVa3xBTx9XXsu0QCFn3va0Uhl70djrgvGzjBogfNw8pJJA37
	VfGYkPEMGEDha3S2xUdfBH3ap9oneBuHz79/R8hmuk+jKzMG6kj24reREhK/WqmVIpC2OLHGJ9z
	RdtbTq6rsUbOsfpfyX9Oqg6GCWvcu4j72nqr7ZNt2464YDq3s9DZO0W85qna4k7hD/G/F5X75xO
	jX/Luxzzn3ySFEctFJ59Kylh549OzdWoSC6HQ9wwoiS6iK5B+YQH8ocsmdgw2WMhHgNE1HZjMEC
	DgpK4iIrZU8aFd+Hytd7Gr0Ns37NpPvpLpi6vJ5ck174H/8Egtd+rwv0SOY+jPsbLBuBr1F3F9x
	Lxk492iQ/DaZm74oMXxtovKmzA9ah/vv63P9n0xQmy7DHwUc8qTrDMTd/R5H8eVbhnEy0+SkKpY
	ppLaRJpVOoit7Y9VI8P2UcEJknKerR/2ukRYDVdIsoXjg==
X-Received: by 2002:a05:6a20:7490:b0:3b2:86c9:baa5 with SMTP id adf61e73a8af0-3b4ccfdbb5dmr16989108637.38.1780896551959;
        Sun, 07 Jun 2026 22:29:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b56c5sm14461062a12.27.2026.06.07.22.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:29:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 wireless-next] wifi: brcm80211: change current_bss to value
Date: Sun,  7 Jun 2026 22:28:54 -0700
Message-ID: <20260608052854.11718-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to a single allocation and remove some boilerplate.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: change to value
 .../broadcom/brcm80211/brcmsmac/main.c        | 40 +++----------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index c7eaf160e1fa..ec3aeaa7bab9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -418,21 +418,12 @@ static int brcms_chspec_bw(u16 chanspec)
 	return BRCMS_10_MHZ;
 }

-static void brcms_c_bsscfg_mfree(struct brcms_bss_cfg *cfg)
-{
-	if (cfg == NULL)
-		return;
-
-	kfree(cfg->current_bss);
-	kfree(cfg);
-}
-
 static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 {
 	if (wlc == NULL)
 		return;

-	brcms_c_bsscfg_mfree(wlc->bsscfg);
+	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
@@ -453,25 +444,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc);
 }

-static struct brcms_bss_cfg *brcms_c_bsscfg_malloc(uint unit)
-{
-	struct brcms_bss_cfg *cfg;
-
-	cfg = kzalloc_obj(*cfg, GFP_ATOMIC);
-	if (cfg == NULL)
-		goto fail;
-
-	cfg->current_bss = kzalloc_obj(*cfg->current_bss, GFP_ATOMIC);
-	if (cfg->current_bss == NULL)
-		goto fail;
-
-	return cfg;
-
- fail:
-	brcms_c_bsscfg_mfree(cfg);
-	return NULL;
-}
-
 static struct brcms_c_info *
 brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 {
@@ -527,7 +499,7 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}

-	wlc->bsscfg = brcms_c_bsscfg_malloc(unit);
+	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
 		goto fail;
@@ -3813,7 +3785,7 @@ static void brcms_c_set_home_chanspec(struct brcms_c_info *wlc, u16 chanspec)
 		wlc->home_chanspec = chanspec;

 		if (wlc->pub->associated)
-			wlc->bsscfg->current_bss->chanspec = chanspec;
+			wlc->bsscfg->current_bss.chanspec = chanspec;
 	}
 }

@@ -5423,7 +5395,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	struct brcms_c_rateset *rs;

 	if (wlc->pub->associated)
-		rs = &wlc->bsscfg->current_bss->rateset;
+		rs = &wlc->bsscfg->current_bss.rateset;
 	else
 		rs = &wlc->default_bss->rateset;

@@ -5450,7 +5422,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 	if (wlc->pub->_n_enab & SUPPORT_11N) {
 		struct brcms_bss_info *mcsset_bss;
 		if (wlc->pub->associated)
-			mcsset_bss = wlc->bsscfg->current_bss;
+			mcsset_bss = &wlc->bsscfg->current_bss;
 		else
 			mcsset_bss = wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
@@ -7809,7 +7781,7 @@ void brcms_c_init(struct brcms_c_info *wlc, bool mute_tx)
 		u32 bi;

 		/* get beacon period and convert to uS */
-		bi = wlc->bsscfg->current_bss->beacon_period << 10;
+		bi = wlc->bsscfg->current_bss.beacon_period << 10;
 		/*
 		 * update since init path would reset
 		 * to default value
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index b7ca0d9891c4..2d133264f4a7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -614,7 +614,7 @@ struct brcms_bss_cfg {
 	u8 SSID_len;
 	u8 SSID[IEEE80211_MAX_SSID_LEN];
 	u8 BSSID[ETH_ALEN];
-	struct brcms_bss_info *current_bss;
+	struct brcms_bss_info current_bss;
 };

 int brcms_c_txfifo(struct brcms_c_info *wlc, uint fifo, struct sk_buff *p);
--
2.54.0

