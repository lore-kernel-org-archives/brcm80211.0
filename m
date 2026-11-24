Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557052;
	b=kHt9tKyoUtnDvTfJ+b8o3dS2Ys8cXDj8SSkjnrxR4cMVR/iKZuJO5ngogEL+2idIuHt4
	 SKYoRQDQRs5QAysPtVBEDNgAta6KEXXK8lie70fkK8YCaJu/6LJGTreVmGRpE0Q5LVx2G
	 ZaFNAdurnIcE6PwZiVHkdTMBTbVlJcxwkmz2FDWKWYPNilZ/AyHRxTjUuE0LeCWP3N7MO
	 wX4/LwDyLIuoIPhwZCZbxfMu9NqsT6/6dvBk5KQsx31vXrWWxAHO0YOA8ReAXaAsAfFor
	 RWDsQtsZukYO77EjPbDG8ju3T4kW7S9cUXcUOFAFQQE0BjT4lrcUwhWaAVm2Qh3EMSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
	b=puyzboc6pEvemqguR87xNhXzvrAQcDaA2eS91uuK3ztMffo39h7ylmqFXuObxecPTpj8
	 1v36P1+OT1GQPaM4wHPtKpRjcH8Pg7Z15CQGuJ9K5Cgan1AcGhTOgf1NtfaOGMqBE8h3H
	 gIWKVj6+D5XPPI+0ZRdcHnVdun1R0daYpCkWwhk/MYAatiLJMHMM9Q3GLNySgdjKxGkIQ
	 2mwLFk8JKjPebRR23305SMtn+Re6p6121ggkhRQSdfTWENNd9Vl58tHhiMxCKH2BtCL57
	 oHhYsebcYSfhjR0GAEcJBpID/LZoEVusk4oiMZ8rK49mrI9RWpppWAAC0Eq0SdHCMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DX0RHItJ;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF9606A321
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2EF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DX0RHItJ
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f04bea9a93so43781955ad.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557051; x=1796161851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=DX0RHItJPIW8FUknLc5mmUCoyxqGmmec1YwNBvm+NMHL9K0QdkjXclfFVcGu6jMC3K
         9jK9021K5A+3c1gBno5czlZrMHKMA8N6U1PCTqomTSEIJ8mZZAYA5vbKZ0MTUgWsOZ0s
         BosU5RkZXbSh0CrBhL2db/nvkHTq5jLVwP+ONr+Bc9ibbMuh8iAo+ZuVdSogxSGif0uZ
         LABiyeD2/W76cHf+kq2YUqmCsRH/ew8rg3l8BxoC2V2hqqEF/F/H4F8vpOlxmBCDfOfs
         uHTRkdqc3KDnafIis3x2K2IBylzRNyuqijxUpu9aXr5vDXX4laoy2d8aKcfRKSn16FNi
         wKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557051; x=1796161851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=T5SCg7gIpwZBcP7OyT1AoL50E5BbI58hKbGWJ4UEsWsAqUpGU+DiRBVzd0/HNLa+pu
         dbFuSoLIh8DOjAh2HhB/c7x2M3gNzTqN2gpXjvXvoCX73dXs/ywJmRRDWz69bVJ+dGn7
         nSswJQo4lMi9WEAbun9MimsmlIEh3qhQv588ZJzHSg9VxwU+WXDgoI3Z3nQHDh1+EC7x
         0nI1MawjeH3Qscd+RssXXGuVOpDKOLKmYUrRzYiy30gX/IbOXZMHOdBFotBX6APcbqwX
         x3yE8NtC2yqcrDaHDUlyyAbWHHfkE4R1nkzKMpdeOyZvfpA90ek3pOo+aNiFYyXfpGD4
         8BaA==
X-Forwarded-Encrypted: i=1; AL+hErEu2H65VI2m6adyXHlTTzmnPVliP1cgUQnT+ITyRu3ecjZuk41EKN/XV0LHMdsFiyKU+7/50D37XsQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+NyWhBDDgXdIN4SeR10wzuQPP+QXegP3FXruIg3PL5/WSRoVMl
	sVKqmsYsx8gfQMBoPkYgOw/kk3KirsB7rux31CnfcPVa04hOjHY7otZZC/lgmQ==
X-Gm-Gg: AZFdTZcUVpJ2Fk50N/DB3n2LDzVsD+4AB/CmfEiwUqQ+4zFjZ5xiEFEv8avo5vd8oM9
	wQz4Xyelz/exB6sScxOJWdWS1p5qXiEkfGjkiupRcexbb33p7VlYmpuX3Aa5GrxQvjWDolQEd/J
	VZF5k3py3VKBDC2I81Wx4GdsOhyEMRxf+JMizJhnjRVWLCZ0xHsSVVgtTJpN09zgXthpqc8WQ35
	R4lg8ej+8RANK0dKlwd8F1teGv5cD+Xn5tYFf2KgO8ZjN5cwr1osSLXoiJujArm6mnEMiAOcpvi
	10HxMlQnJ0vgV7AbXKyK48OAR4TAfXqqb2zStpRpWrUzcRxfLCn3aDXTjL/qrqAk9Q+DkX7rm2O
	4RvmNib96Xt33uXlBq7I3/R/bOkZPoJdz6v+hsaaMjSYZ6Uaw58pT3zUG0vVonooLCJLYCxkYmi
	SLbAa/Yq8yDCwzCeMS9DICAeFtUrH0ekByObakeVQhyrXGgNeinfQM33DgjFrR5Xu8JaA/cfwEp
	vdDFUk0PwR93Euveb/e5QnjdzOHZ/MImcMWOLan7nomACDZsXbKJI/yl0mon2PPGOBwyQkREce+
	KLj+532MTQS9D6ODYDZV+Jn3n0AIbKaF7jBsJUmT6VsuoN4gTO7TKOx9mdtYcUB2GQLBfoP/MFg
	k2fFS+FdKI1X0mEfBUoTGFCFuKSHwbmgJkLTY8DkaxzlQC9ChGHtCX43xYmxddmuQ40fX9JD3LQ
	2uuNONtt5ocJ2awQLj0/6HF8o=
X-Received: by 2002:a17:902:c402:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2f03f211b8emr172219685ad.34.1795557051242;
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:37 -0800
Message-ID: <20261124215040.1261999-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124215040.1261999-1-rosenp@gmail.com>
References: <20261124215040.1261999-1-rosenp@gmail.com>
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

Replace the separately allocated default_bss pointer with a
directly embedded struct brcms_bss_info in brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..b40761e571c2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -862,7 +862,7 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 				brcms_dbg_ht(wlc->hw->d11core,
 					  "%s: Pkt tx suppressed, illegal channel possibly %d\n",
 					  __func__, CHSPEC_CHANNEL(
-					  wlc->default_bss->chanspec));
+					  wlc->default_bss.chanspec));
 			} else {
 				if (supr_status != TX_STATUS_SUPR_FRAG)
 					brcms_err(wlc->hw->d11core,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index d000e2a70870..2140feb86964 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
@@ -461,12 +460,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
-	if (wlc->default_bss == NULL) {
-		*err = 1010;
-		goto fail;
-	}
-
 	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
@@ -822,7 +815,7 @@ brcms_c_dotxstatus(struct brcms_c_info *wlc, struct tx_status *txs)
 		brcms_dbg_tx(wlc->hw->d11core,
 			     "Pkt tx suppressed, dest chan %u, current %d\n",
 			     (xfts >> XFTS_CHANNEL_SHIFT) & 0xff,
-			     CHSPEC_CHANNEL(wlc->default_bss->chanspec));
+			     CHSPEC_CHANNEL(wlc->default_bss.chanspec));
 	}
 
 	tx_frame_count =
@@ -3311,7 +3304,7 @@ brcms_default_rateset(struct brcms_c_info *wlc, struct brcms_c_rateset *rs)
 	brcms_c_rateset_default(rs, NULL, wlc->band->phytype,
 		wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
 		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(wlc->default_bss->chanspec),
+		brcms_chspec_bw(wlc->default_bss.chanspec),
 		wlc->stf->txstreams);
 }
 
@@ -4639,7 +4632,7 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 {
 	u16 chanspec;
 	struct brcms_band *band;
-	struct brcms_bss_info *bi = wlc->default_bss;
+	struct brcms_bss_info *bi = &wlc->default_bss;
 
 	/* init default and target BSS with some sane initial values */
 	memset(bi, 0, sizeof(*bi));
@@ -5198,9 +5191,9 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	}
 
 	/* Set default bss rateset */
-	wlc->default_bss->rateset.count = rs.count;
-	memcpy(wlc->default_bss->rateset.rates, rs.rates,
-	       sizeof(wlc->default_bss->rateset.rates));
+	wlc->default_bss.rateset.count = rs.count;
+	memcpy(wlc->default_bss.rateset.rates, rs.rates,
+	       sizeof(wlc->default_bss.rateset.rates));
 
 	return ret;
 }
@@ -5221,13 +5214,13 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 		wlc->pub->_n_enab = SUPPORT_HT;
 	else
 		wlc->pub->_n_enab = SUPPORT_11N;
-	wlc->default_bss->flags |= BRCMS_BSS_HT;
+	wlc->default_bss.flags |= BRCMS_BSS_HT;
 	/* add the mcs rates to the default and hw ratesets */
-	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
+	brcms_c_rateset_mcs_build(&wlc->default_bss.rateset,
 			      wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
 		memcpy(wlc->bandstate[i].hw_rateset.mcs,
-		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
+		       wlc->default_bss.rateset.mcs, MCSSET_LEN);
 
 	return 0;
 }
@@ -5269,7 +5262,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 
  good:
 	/* apply new rateset */
-	memcpy(&wlc->default_bss->rateset, &new,
+	memcpy(&wlc->default_bss.rateset, &new,
 	       sizeof(struct brcms_c_rateset));
 	memcpy(&wlc->bandstate[bandunit].defrateset, &new,
 	       sizeof(struct brcms_c_rateset));
@@ -5299,7 +5292,7 @@ int brcms_c_set_channel(struct brcms_c_info *wlc, u16 channel)
 			wlc->bandinit_pending = false;
 	}
 
-	wlc->default_bss->chanspec = chspec;
+	wlc->default_bss.chanspec = chspec;
 	/* brcms_c_BSSinit() will sanitize the rateset before
 	 * using it.. */
 	if (wlc->pub->up && (wlc_phy_chanspec_get(wlc->band->pi) != chspec)) {
@@ -5343,7 +5336,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	if (wlc->pub->associated)
 		rs = &wlc->bsscfg->current_bss.rateset;
 	else
-		rs = &wlc->default_bss->rateset;
+		rs = &wlc->default_bss.rateset;
 
 	/* Copy only legacy rateset section */
 	currs->count = rs->count;
@@ -5370,7 +5363,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 		if (wlc->pub->associated)
 			mcsset_bss = &wlc->bsscfg->current_bss;
 		else
-			mcsset_bss = wlc->default_bss;
+			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
 		       MCSSET_LEN);
 	}
@@ -5403,7 +5396,7 @@ int brcms_c_set_beacon_period(struct brcms_c_info *wlc, u16 period)
 	if (period == 0)
 		return -EINVAL;
 
-	wlc->default_bss->beacon_period = period;
+	wlc->default_bss.beacon_period = period;
 
 	bcnint_us = period << 10;
 	brcms_c_time_lock(wlc);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 0e6a5edc74c8..94966418b069 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -524,7 +524,7 @@ struct brcms_c_info {
 	s8 ofdm_40txbw;
 	s8 mimo_40txbw;
 
-	struct brcms_bss_info *default_bss;
+	struct brcms_bss_info default_bss;
 
 	u16 mc_fid_counter;
 
-- 
2.56.1

