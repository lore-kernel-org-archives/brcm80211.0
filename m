Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557059;
	b=5H2G9ah8FwuSw3NkDigAaii0WXYxzNCUKTZYjJ8LKUdTS/u/IO4bOOKsdSq6WUAc12a1
	 IxM9Z0q8gHID8bqY8eAB1IUWRwXnl/E0ChuaHSvTUMKBxmE+nx6UK4JVlYbcF1e56mAZ+
	 B0FIpm0O9/emJwF1F/PCdeT7nl3SoJlndrdm1MIpSURjex4xOn/F+h5t5jihlVPEkOj9Q
	 YifvbIFzJgqrhvNtam5wOUm/uX4DTS8GyzZvL0daBbjuhI/H9eiqUkmFSSWONVPrNvIcC
	 8yA1oYZoWTUh65K93BNzKNJ2Z0vrlRADoicCfczI0tbHWMp/8JqCnjgY3CtA6oTjTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
	b=VfVJ/4oUBRZktI8XKZFAiOvrDNKOlYlobxR+Ceo+YmkTeT+InlO64/C8qYRjGQIvWqEa
	 EXCXjctCq1uZ13afNe8Z+B9RlbQ4GIiX0R7VcRfUkTtL6LC0lI0s5I/a0BNzIZt0nFAJu
	 1CWyL6jiuI8JywKnuHpee228Bbq+ArgIjBmDq5l3qhXRXK1/r1uaXcmVZgaXcwWBy/eJE
	 Q6GALTB+oHtgZA0HyXy358hhPWOrrgS3jiJbvbPLEn4dYRHxUEoOFh9QRyX9JQpYnpQPS
	 DQPPbs37Y3r9mtIsr7c+OOGiWU3km/YwqxvZyWHrB8AUixfpVcFOf8x66zjRKZPGCVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnnIOgHC;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58435606A33E
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58435606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnnIOgHC
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04244c3d0so41292595ad.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557059; x=1796161859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
        b=WnnIOgHCQi1jTIdtkSpSZ+1Jcr5jhXnU3bQ15uYonRoVC0W/+wUFUHTbQuTwpGwnC2
         O0gQHbib2PsFUgoid9EKX03rUrDaLrp65ZG0V0XkeknEcydQgqH5Ka65J5GzwIteUrgy
         L/pjWH4dHyyAbslkwiK1iDmqSy64ghHiGXz3Dgiq6FV/BJnmLrgbDdztjreYhxc3nb0+
         ykJct+IoSlljkN4ubdNwm7TLnjtJ/y8RsLyz2yRHpCLUjjzR0CS7XFOWThApn2fD9w2C
         VL7QpvX8Ve4Zc3+CkfwwN4eXlRo/mtp4jSEVzbIa1jTjAm9CPmnCYWktwFeLZ0L1ZnAz
         ao6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557059; x=1796161859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4pGvAMXjcOC4SqD7p4YoLcU2/NkDU3u07H7Y6Y74K8=;
        b=Wy+3DyFkOYwYkhDtf90Uh+CVP/ktpaerWN1MAYoDcS6XxyCCUDQODbArmy+OmNG/SO
         zqK7ePMkvClX4l4zZaQe4rLG1gX8XUVdNJErdvHEMet0Tf1G1uT0TbyTXw4hRu95GozX
         FLXHxbsCsTMZOawLiAqSaY1n/RS3vEljwxMRwsaT/o8YUWnbxWz+pTBsXLeGd/PuNG4g
         uTcRQMrm4Xk5N3CjtveLbMfQhOmiOneJm32o1dRCmuCF6fMYaino4QVoo4PhrI4yketC
         GwuxPcy922xCePMZrvMi2HHXd3XQJfb6b90nNYMkslsSAWAyifDgNZZnhfWKhhAa/HQc
         Fx9A==
X-Forwarded-Encrypted: i=1; AL+hErG4EnbV5rMQYhgDFD6xnPe+/9sSSp5Wnozhk9iN4jG8vPv2NWtMLQ58jaMR0C0g8Gby5PEIvnTyYsk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/biyrzLij0EsvnEHSnD8xnc35fCY3Fo5Iva9AGYznKAoenBHYY
	zUo8Bi0XxPyluStUrC4W3SNY/lGPw5Fgzny7weZFEWIDUHaiW4Zz36bZ
X-Gm-Gg: AZFdTZd1uPqCy8XwN3rUH4FSqAVccXqM6DFVLbuo2HtxQl3S+y17NimQfyhpBUHQb0U
	rdxwGuqdNMg7db5aJf9Aqx9zC1+4z6ydlAhHgRDoi3Hjy8yMN7o0UPhuQLOeUKvnNtHFCbX+kkH
	NR6HqoCEJYHlqXkQDV3HTmxyZyuQ+u9TL5ucbBT5cgKaC3cv2d3oulDzaa8xWO+uygzYMpZqEVO
	KY6a9nc++Fz+EaZz/fawM6tGH8oFSTjShsEYxSy0oYAjy6t+W2KWesiizXDPicJU9TFKbWo9Y32
	0kROGGhaq9f/gbnJaSBI+78WVSKn5FmuWWCAzAQ/CdJs6fbr6fhe1rCfeWaaZy64NdUqfV0CjaU
	5F6VPxVkB9LRfQUlnzJK5yJ0cquNH3czXxLoIVGqknPB4qEbNgHmrm3aM6EsIzAErdsS8gH9qYE
	64DE/c1JEMKdp1EOMlGcKDroqmVLH4cdfpksXzDSyr3kJokXk2zWWFIoQuw/PjDmP/ljmKv3WLY
	w8iPgFt4rUXEpcGVL/SV9hbpz96EM9/dv8A2uLsuYI+eubUoHx6G+n5wy1Tv212w7VqBVyVZOL+
	yRoAFekDgmql2qEKWM4IURawXoJ0hMJlVT7V0S64zUSToJHS1Xam0WsFfx1MLeQYkCkxFg4bm6q
	UQ2fLIbNlBQHCYDibl/csldINvgi8nDjfPqtlyyZVkJNalut7gzbRGj2Sg49OHdmJuAWDzDib2L
	Ldv78=
X-Received: by 2002:a17:902:d2cf:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2f03ef44a68mr172906535ad.3.1795557058757;
        Tue, 24 Nov 2026 13:50:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:57 -0800 (PST)
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
Subject: [PATCH wireless-next v2 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:40 -0800
Message-ID: <20261124215040.1261999-8-rosenp@gmail.com>
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

The driver only ever has one BSS configuration, and it has the same
lifetime as struct brcms_c_info. Embed it directly instead of
allocating it separately, removing one kzalloc()/kfree() pair and its
OOM error path.

Move the struct brcms_bss_cfg definition, unchanged, above struct
brcms_c_info so that it is a complete type there.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
 .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
 2 files changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 422452b8a832..dfd87a10cbf9 100644
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
@@ -7918,7 +7912,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	 * Complete the wlc default state initializations..
 	 */

-	wlc->bsscfg->wlc = wlc;
+	wlc->bsscfg.wlc = wlc;

 	wlc->mimoft = FT_HT;
 	wlc->mimo_40txbw = AUTO;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 5e2052bd913a..be40a0c008b7 100644
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
@@ -514,7 +547,7 @@ struct brcms_c_info {

 	u16 wme_retries[IEEE80211_NUM_ACS];

-	struct brcms_bss_cfg *bsscfg;
+	struct brcms_bss_cfg bsscfg;

 	struct modulecb modulecb[BRCMS_MAXMODULES];

@@ -583,39 +616,6 @@ struct antsel_info {
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
2.56.1

