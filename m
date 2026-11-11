Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371177;
	b=xeN0Ho7n/sEvHDqZm+k8t8tIsl+7JrkTFsWnd9oUaD6pYH+EtYDRBm68HTJRofumstc4
	 GMvVI+U7mZCMXUlJWw3cRZtIqb9/mQSzmtAHRTrPg9H4y1DSVzG13vic7qIpBov3Fgchj
	 nVKyzG53oip8+LRYLfqT/Q2GFWhtjB4B5HeN/kdoBtwxmx9SI+aWkK0idG6hRzWdi/Cc/
	 l2K1eUIPomNmSlWXvT1rcJA+RUHdqz0tVuYMheemcCjb+oi6cFYx9WRru73gFsgj/RM7Z
	 /Dy8b9Ea6A7ySTR42UgYw46SIsM7cqWTwu3cHpz27uKgQnuH3PloRMT7XZTNOut6FzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
	b=bl/N88AHngu2QXLv4nXFqs+lQb3UL3go0fOGbBcM37MfPetbqd3UVKjCuvlp3uAmTNNO
	 oiGo/L2F9vfjq2OHur4+kGQLXHhS+VbPnaagsBBiHHc0pKL/HYpzsh8lAAgiT5zqelTl+
	 UUUV1dWgbB0bcU0LwXiaS2pa42A0gCL9pwf3SXAOanvPzphJHNUMeN+Us+TQIung+r7XX
	 mKMRhPVMfnzm+Q3azBkbVe459E4uijHuNWpcHKY5vJyInCwcKtkKGwjIW8l0sBKLQD9LS
	 R6Gk9ZCzrmWdaD3qqSmFuqa1Ij72gkabBhRsh5qNMiuNl0xHnXqbrgcIfX50zWtevpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1DSrMQZ;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8F606A330
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F8F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1DSrMQZ
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1567240a91.1
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371176; x=1794975976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
        b=h1DSrMQZB+m7ekQt9rawm4nvZyDq1a1DgNoylgkh1jJL6Qx7SO0upNKxgdgtOt5xXF
         DDvsqePYRORUZWnmOmWcHa4WVUZDe7A41roIix9ndHZakkxrr8D87VO3QURfWy+SAP2/
         99e0SdfuE95e9QlqfaCVAuK12RbjyaE7JuK82AhgAjyPnMTYEa8H025ZEBs7sxSAbj84
         IEw/9F2wPM8RHiQNBP5XPBr4PUtdEZ82mKxIBEFFjqw+BNcY1FWhEsYqx73oazy0tIFH
         mdq9GcWa5TZPYvcnXVTuf1K6uPersc0PeusmvTl4I2jWkMUDSFDYsnabQt7ssCnl7VZz
         gzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371176; x=1794975976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fVFyYp3e9+uqEfX9h8TpIz4lzT5VdcXQx7G7TjI+E4=;
        b=K+ay3gGPBiRxY9NOLAI6MwmtMUwAq2Kt16taZGcML5wrLM5NfgdC2pRoL2aUXT4Lto
         EFYp6BPBlxTdARibaeTghSb3DDqqzaaLznDxzS9C1M6cnaRpNyql9BW2SvRyELHQXDYB
         2ouS9p1Bt0JmJLIHybqHgqT8V+O0tgir0MOlSa66q00Xb+qdjL1C4ZnJvaO+HBLBqX1f
         3xPemJfLCB8+/Fq6Js1b7TwKP54h4V6aZsRMevgC9T+bDiniIF/fbPhWZf4syiGhrkBG
         pZ2KObBhgpouzBO3y+Gl85aDcZNKDEWTK6hdH8nNbJvGSA0vluzeud0bF5NJad5+lkkG
         7b6w==
X-Forwarded-Encrypted: i=1; AL+hErFn1/laFtVjXYqqTUGxkGqqqBqKwBfluAUWq/D+0DiZeFrEiHgpRqh3JE39NoBq0u7A+CUXXYa52KM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ztkZowXAJMtkgWLmLJUYuaNEBumgF5K+j93LG6lyEYRfnOrzK
	R/KVC86TI1LSzWaoBB1oR4r2F5cLRNWRQ0fMainHvzk35ue4JyQMktmB
X-Gm-Gg: AYBFou0ctdRu6PrQ/hryQekPiP4G7AUklYxEGHgBpDSQjmwtiExfz2WtBX6VkR3qBH6
	LqaO4fWkS6yb/Cu1qRra++P4HY4kvPBJldW7T4m1ycXp8PmDtY1T2e0+Tu+83VGWDiHWbQK3dNO
	wBwnYFfKXB5d7FzRYR5nzzOajaVkHvJsSregjfIt/z6UXkFOpwnyCaidQSYvOQdGBIueIT4ngAp
	gnqr+dQB32TSVeehlH/kaXeNfCF8yJRgVRv5bABM8B7WdKKHbm34nKvVAvkE2ujJ9ZBZp1jL+Ib
	e0LPPjYEtbDz7uN0aUZH9P4K0Sxq2zOUl9I1rRhQahPN1uN6eUyMsLqcUT3+Gp9ay6d7wsQ6PIU
	VB26Sw/bWj2W8Os848DrWE0pgRXhdc2vKP7CVt5qcs9CArpkFEQsHt2TDcSYJBw7DD45wlBcPWD
	A8TFfLe3f23KKEmudaiXJfAL4j9/ShLRixnn6+bPYDbgX2A5he0cM4PRePnn20/t6F7SURnP9hf
	bcNzOhbYoBS9a0lVcvV9y56FEcuCH9I9KsLE2STNB6HmqCz9YedRmjbwxPXTJgRGAttopsX418s
	G43Zr5sRZn4qgLKVYV8YTZ8CZUQicqbh/aAsHJvstVlLsOFrfE+vKRo5VszVBmN2Yo8xJjwOPNq
	+7iOJ9HB4perdemjTFsvTVlrx7piTXiAfoRW6NCyW9JCyvBpkTYAp82CGrWt8daKiOr0O/WGr1P
	iBfo0=
X-Received: by 2002:a17:90a:da83:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3b182fb013fmr942201a91.41.1794371176404;
        Tue, 10 Nov 2026 20:26:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:51 -0800
Message-ID: <20261111042554.232998-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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
2.56.0

