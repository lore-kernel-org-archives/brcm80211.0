Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371181;
	b=u53EXSDefVg2voGBDpfNYvNQn3wB9tbJvwlBK+Lw9SjXFNrn1tB/ZG/iv8eAGPj1nm3v
	 WC+FI6WyubqB8hdGDlVCMupC3v22/ujSDd6/J6jhCQT+Kf0Fb+GOoBu00uQq0UDd/te8c
	 /XODzvkFW/v5VdH9QUvgpetkA20eI8hugkOG8mS/kROs6Aftda4hnUcNzjeAdIQRmZ+13
	 ydG4f7vVXbrX77nD05d82DHwyMlgCOMYY1+H3MalR/kYRzR3uvMQJk9kuyVxrMAaZ7EkV
	 EZZQ5SsE5PdWz2UDqwVrxBhcvPJHECG+iL+PlqUr8k2JRDk21NWov+EgqeqzLvqTc+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CgkDxROBEf4stOeD1nK82+FjZn2eJhF0D+tbKTCs9xs=;
	b=2Zv+pMkfw66EW01dzhz5wl5fvQNA9XZpdIjitWdlLBRtwbl2x9g0kbxru/CIQGbL4ApV
	 Kcyorb5n1adeU0OfNaGX7SLeBJTwj2j3KQra2xhnuCh7E4V9dU6CRNxko0DWsPUoyWNcE
	 kTab4pECFuLsMFRAIlm2owJbbwtDdhC/xi+SH4YgeNNhCUJSXIqAZP8g6q8iy12yWMRwq
	 7q359n2FMzqKgbNtBxdSkneW8NAIPJ8UAeFyIqcklxzicQAbSFNTBtYHxeUBtcYa6L6Nc
	 owBdsUm33xfzh/t93j6dw590w82y/SsbJJZyQVeLDo37KbTPg483Hdw3t5+Qi1m4Qxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/5E9KQO";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D2560A5BD2
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D2560A5BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/5E9KQO
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1560866a91.0
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371181; x=1794975981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgkDxROBEf4stOeD1nK82+FjZn2eJhF0D+tbKTCs9xs=;
        b=r/5E9KQORjd0wc0nZGeuUu7xnTM8SLEBN9O0Jk+wxjVXoTt1Rin76PwKLgeMlypCPi
         uRhZDFnXz0IiBxfnFvQu5Bip4eXp1aIst/Epz6kHgkeJ1NPyIJORIEt2d+TeAOTDczeE
         7hzB20c7FPjk/Bttc3Q0bLytWy0jwrlt+qKkiziV+GwBee2iErenrfUHKxbJqyXV3sN9
         OSmhc9Y1uxx4YDqwYqt9MOlOQhIgxPmiY7co5kZAdLgO3M6v5LqyF8971IhxftSaT1Ws
         WtFpVeW/stPiCAuHuAtEEbp7exYIH+AmNPcp7xq8HL/neEo1jEim2+2FAFpXX1tK/vsn
         7jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371181; x=1794975981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgkDxROBEf4stOeD1nK82+FjZn2eJhF0D+tbKTCs9xs=;
        b=CCVSU6rxrWuKD5HC7ESKi2quLbDjqA1uTBkSLL5ooNc+uNw8pKBYDCYf47IQ+BS/Mm
         ZVDxZInuPnnA4ozhaRe+97GOmWjdgMoVZhNZXjjaTVSM4EM8ivsqBMBilG4gz5Q3ql41
         qTj4lUE97i4bQK+ceNph35DjjEXC0fkU6F7JXW+3j6xTnEXp33U8qwd+NrqG5hd5+kky
         f5ydT34rjgDmPsmjFYhpELiHU9xjzRcvreLmz6DE63bYFyckV36bl/6O6nEhR/ZxQgV5
         hd37Iyp1VyvUJGORaHlqzFoQxrHr1i5p357k25+UJu6xfWF3WUPw7K2BmoQkXwh60jYA
         CYug==
X-Forwarded-Encrypted: i=1; AL+hErFxXdSi7dlbbq1LzHjlOIryHE5yxQvX9TKA5l50s2nWm2hwmsTDDMvKSCvkhfnspRS99kMfB5qfM7w=@lists.linux.dev
X-Gm-Message-State: APuU4Z9f5oArtofKPumhIrcCnNHtcB5mz81nNdTtp0xbfese9pn9o1Dt
	Zi2y3cuYWJzjMEPjsK9WPgN7O8cmI+hg0b4LcvOhvrEHnQZxiYJPuuOT7WYbIhq+
X-Gm-Gg: AYBFou3G+G9TtKvK0FdKpSGKyMavKEeWcWnGwCS8SZykyr7QDf8hvf1/Ldz/GasiY+5
	YVcmlJsSQlbP4TJqyv1WB0eysySeGzcmKE3q9cc4ynbUW0TrM9r6NELeadBUP6nyCS3fGNO3org
	XUoE06ZGd1BjV8GOxU5rE7n7BNR2VsKc9LftXop6ifpIls8qe30ZLPULr6obPqpmeeGVyjyk5cS
	cOiUVahsCMTe9HJxX0kmt+wbWFmodLtJqa8Dl6wG/5Pus1NQjHTryjxAbEygTPD2lWS2sLg/j9I
	mSW2L8xm0+lNnNfGKpFiFpAfn91Sva/RM59LNFcTay4wsG7Hb9WUExJdArn++zPBuPFWQD/CdUl
	NUrBiqmxzwM9NQspqqMxDE2iAJAVFeGjrCHxfBBD0A8meAeFxkq1zsgZ8nLlsZZk0dDfBvnDY5p
	stzseZ8xKi/4XXoEaRrv9k1QFruIwEkyb9arNf+MqDyOQT//JeqoIuxSPxGXIf7aKOykV2Bo1DI
	JUX0fyAhRkTckLvUI3fneo266L8AYhVf7IB6OqtOxtsTxvk4jT4GrWHHrn8FWk1NXIsYrFvzWSq
	HEd35Hu4tndewTGyfUDhr8hmZyVs+COhZ4h6AA39SVNFnlf6t48WL0PpjqYyxvV++9LtGcLnSGk
	Q/1bO3Rdr5jI0uIHfFgB9c4wu/SIyiNA03L5F8RwqolbGNaGEwcTDt7XF2pIXID/H3K2gCF+oKL
	czAso=
X-Received: by 2002:a17:90b:1c88:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b182f65f31mr1189585a91.42.1794371180098;
        Tue, 10 Nov 2026 20:26:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:54 -0800
Message-ID: <20261111042554.232998-8-rosenp@gmail.com>
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

The driver only ever has one BSS configuration, and it has the same
lifetime as struct brcms_c_info. Embed it directly instead of
allocating it separately, removing one kzalloc()/kfree() pair and its
OOM error path.

Move the struct brcms_bss_cfg definition, unchanged, above struct
brcms_c_info so that it is a complete type there.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
 .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
 2 files changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 8c3048082fbb..7046c116605c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -418,7 +418,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	if (wlc == NULL)
 		return;
 
-	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
 	kfree(wlc->hw);
@@ -458,12 +457,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
-	if (wlc->bsscfg == NULL) {
-		*err = 1011;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -955,7 +948,7 @@ brcms_b_txstatus(struct brcms_hardware *wlc_hw, bool bound, bool *fatal)
 
 static void brcms_c_tbtt(struct brcms_c_info *wlc)
 {
-	if (wlc->bsscfg->type == BRCMS_TYPE_ADHOC)
+	if (wlc->bsscfg.type == BRCMS_TYPE_ADHOC)
 		/*
 		 * DirFrmQ is now valid...defer setting until end
 		 * of ATIM window
@@ -2049,7 +2042,7 @@ void brcms_b_switch_macfreq(struct brcms_hardware *wlc_hw, u8 spurmode)
 void brcms_c_start_station(struct brcms_c_info *wlc, u8 *addr)
 {
 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	wlc->bsscfg->type = BRCMS_TYPE_STATION;
+	wlc->bsscfg.type = BRCMS_TYPE_STATION;
 }
 
 void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
@@ -2058,8 +2051,8 @@ void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
 	brcms_c_set_ssid(wlc, ssid, ssid_len);
 
 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	memcpy(wlc->bsscfg->BSSID, bssid, sizeof(wlc->bsscfg->BSSID));
-	wlc->bsscfg->type = BRCMS_TYPE_AP;
+	memcpy(wlc->bsscfg.BSSID, bssid, sizeof(wlc->bsscfg.BSSID));
+	wlc->bsscfg.type = BRCMS_TYPE_AP;
 
 	brcms_b_mctrl(wlc->hw, MCTL_AP | MCTL_INFRA, MCTL_AP | MCTL_INFRA);
 }
@@ -2067,7 +2060,7 @@ void brcms_c_start_ap(struct brcms_c_info *wlc, u8 *addr, const u8 *bssid,
 void brcms_c_start_adhoc(struct brcms_c_info *wlc, u8 *addr)
 {
 	memcpy(wlc->pub->cur_etheraddr, addr, sizeof(wlc->pub->cur_etheraddr));
-	wlc->bsscfg->type = BRCMS_TYPE_ADHOC;
+	wlc->bsscfg.type = BRCMS_TYPE_ADHOC;
 
 	brcms_b_mctrl(wlc->hw, MCTL_AP | MCTL_INFRA, 0);
 }
@@ -3669,11 +3662,12 @@ static void brcms_c_set_bssid(struct brcms_bss_cfg *bsscfg)
 
 void brcms_c_set_ssid(struct brcms_c_info *wlc, u8 *ssid, size_t ssid_len)
 {
-	u8 len = min_t(u8, sizeof(wlc->bsscfg->SSID), ssid_len);
-	memset(wlc->bsscfg->SSID, 0, sizeof(wlc->bsscfg->SSID));
+	u8 len = min_t(u8, sizeof(wlc->bsscfg.SSID), ssid_len);
+
+	memset(wlc->bsscfg.SSID, 0, sizeof(wlc->bsscfg.SSID));
 
-	memcpy(wlc->bsscfg->SSID, ssid, len);
-	wlc->bsscfg->SSID_len = len;
+	memcpy(wlc->bsscfg.SSID, ssid, len);
+	wlc->bsscfg.SSID_len = len;
 }
 
 static void brcms_b_set_shortslot(struct brcms_hardware *wlc_hw, bool shortslot)
@@ -3711,7 +3705,7 @@ static void brcms_c_set_home_chanspec(struct brcms_c_info *wlc, u16 chanspec)
 		wlc->home_chanspec = chanspec;
 
 		if (wlc->pub->associated)
-			wlc->bsscfg->current_bss.chanspec = chanspec;
+			wlc->bsscfg.current_bss.chanspec = chanspec;
 	}
 }
 
@@ -4918,7 +4912,7 @@ int brcms_c_up(struct brcms_c_info *wlc)
 		if (status == -ENOMEDIUM) {
 			if (!mboolisset
 			    (wlc->pub->radio_disabled, WL_RADIO_HW_DISABLE)) {
-				struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+				struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;
 				mboolset(wlc->pub->radio_disabled,
 					 WL_RADIO_HW_DISABLE);
 				if (bsscfg->type == BRCMS_TYPE_STATION ||
@@ -5320,7 +5314,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	struct brcms_c_rateset *rs;
 
 	if (wlc->pub->associated)
-		rs = &wlc->bsscfg->current_bss.rateset;
+		rs = &wlc->bsscfg.current_bss.rateset;
 	else
 		rs = &wlc->default_bss.rateset;
 
@@ -5347,7 +5341,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 	if (wlc->pub->_n_enab & SUPPORT_11N) {
 		struct brcms_bss_info *mcsset_bss;
 		if (wlc->pub->associated)
-			mcsset_bss = &wlc->bsscfg->current_bss;
+			mcsset_bss = &wlc->bsscfg.current_bss;
 		else
 			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
@@ -7228,7 +7222,7 @@ static void brcms_c_update_beacon_hw(struct brcms_c_info *wlc,
  */
 void brcms_c_update_beacon(struct brcms_c_info *wlc)
 {
-	struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+	struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;
 
 	if (wlc->pub->up && (bsscfg->type == BRCMS_TYPE_AP ||
 			     bsscfg->type == BRCMS_TYPE_ADHOC)) {
@@ -7337,7 +7331,7 @@ brcms_c_bss_update_probe_resp(struct brcms_c_info *wlc,
 
 void brcms_c_update_probe_resp(struct brcms_c_info *wlc, bool suspend)
 {
-	struct brcms_bss_cfg *bsscfg = wlc->bsscfg;
+	struct brcms_bss_cfg *bsscfg = &wlc->bsscfg;
 
 	/* update AP or IBSS probe responses */
 	if (wlc->pub->up && (bsscfg->type == BRCMS_TYPE_AP ||
@@ -7366,7 +7360,7 @@ brcms_c_set_addrmatch(struct brcms_c_info *wlc, int match_reg_offset,
 {
 	brcms_b_set_addrmatch(wlc->hw, match_reg_offset, addr);
 	if (match_reg_offset == RCM_BSSID_OFFSET)
-		memcpy(wlc->bsscfg->BSSID, addr, ETH_ALEN);
+		memcpy(wlc->bsscfg.BSSID, addr, ETH_ALEN);
 }
 
 /*
@@ -7698,15 +7692,15 @@ void brcms_c_init(struct brcms_c_info *wlc, bool mute_tx)
 	brcms_c_bcn_li_upd(wlc);
 
 	/* write ethernet address to core */
-	brcms_c_set_mac(wlc->bsscfg);
-	brcms_c_set_bssid(wlc->bsscfg);
+	brcms_c_set_mac(&wlc->bsscfg);
+	brcms_c_set_bssid(&wlc->bsscfg);
 
 	/* Update tsf_cfprep if associated and up */
 	if (wlc->pub->associated && wlc->pub->up) {
 		u32 bi;
 
 		/* get beacon period and convert to uS */
-		bi = wlc->bsscfg->current_bss.beacon_period << 10;
+		bi = wlc->bsscfg.current_bss.beacon_period << 10;
 		/*
 		 * update since init path would reset
 		 * to default value
@@ -7919,7 +7913,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	 * Complete the wlc default state initializations..
 	 */
 
-	wlc->bsscfg->wlc = wlc;
+	wlc->bsscfg.wlc = wlc;
 
 	wlc->mimoft = FT_HT;
 	wlc->mimo_40txbw = AUTO;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 72720b9f9b35..30d62049775a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -378,6 +378,39 @@ struct brcms_hardware {
 				 */
 };
 
+enum brcms_bss_type {
+	BRCMS_TYPE_STATION,
+	BRCMS_TYPE_AP,
+	BRCMS_TYPE_ADHOC,
+};
+
+/*
+ * BSS configuration state
+ *
+ * wlc: wlc to which this bsscfg belongs to.
+ * type: interface type
+ * SSID_len: the length of SSID
+ * SSID: SSID string
+ *
+ *
+ * BSSID: BSSID (associated)
+ * cur_etheraddr: h/w address
+ * flags: BSSCFG flags; see below
+ *
+ * current_bss: BSS parameters in ASSOCIATED state
+ *
+ *
+ * ID: 'unique' ID of this bsscfg, assigned at bsscfg allocation
+ */
+struct brcms_bss_cfg {
+	struct brcms_c_info *wlc;
+	enum brcms_bss_type type;
+	u8 SSID_len;
+	u8 SSID[IEEE80211_MAX_SSID_LEN];
+	u8 BSSID[ETH_ALEN];
+	struct brcms_bss_info current_bss;
+};
+
 /*
  * Principal common driver data structure.
  *
@@ -515,7 +548,7 @@ struct brcms_c_info {
 
 	u16 wme_retries[IEEE80211_NUM_ACS];
 
-	struct brcms_bss_cfg *bsscfg;
+	struct brcms_bss_cfg bsscfg;
 
 	struct modulecb modulecb[BRCMS_MAXMODULES];
 
@@ -584,39 +617,6 @@ struct antsel_info {
 	struct brcms_antselcfg antcfg_cur; /* current antenna config (auto) */
 };
 
-enum brcms_bss_type {
-	BRCMS_TYPE_STATION,
-	BRCMS_TYPE_AP,
-	BRCMS_TYPE_ADHOC,
-};
-
-/*
- * BSS configuration state
- *
- * wlc: wlc to which this bsscfg belongs to.
- * type: interface type
- * SSID_len: the length of SSID
- * SSID: SSID string
- *
- *
- * BSSID: BSSID (associated)
- * cur_etheraddr: h/w address
- * flags: BSSCFG flags; see below
- *
- * current_bss: BSS parameters in ASSOCIATED state
- *
- *
- * ID: 'unique' ID of this bsscfg, assigned at bsscfg allocation
- */
-struct brcms_bss_cfg {
-	struct brcms_c_info *wlc;
-	enum brcms_bss_type type;
-	u8 SSID_len;
-	u8 SSID[IEEE80211_MAX_SSID_LEN];
-	u8 BSSID[ETH_ALEN];
-	struct brcms_bss_info current_bss;
-};
-
 int brcms_c_txfifo(struct brcms_c_info *wlc, uint fifo, struct sk_buff *p);
 int brcms_b_xmtfifo_sz_get(struct brcms_hardware *wlc_hw, uint fifo,
 			   uint *blocks);
-- 
2.56.0

