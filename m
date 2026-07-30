Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08822449B3E
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428513; cv=none; b=M79t42C/PshmYLcYGHaUqBFTG3C/NNfXN4DicHrC8xxSrpHeu2tiHMVGUGiBfjoONUIr8J35eGzVSj8zdoNPImDVSuEnPMY6qvcGoSyyfrKsMdpFuIkqUhX6MwcfXwTniS3BAlaiwqatcGkeHE4ckv1gzj5NyhIB30Vfk5m7c9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428513; c=relaxed/simple;
	bh=ubYEXsR4tEV0OYeMr1Q2ItQdS8K2QO1zmn+B8cI/9Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPezChn8nOU2IkzMh8fWU5rerV9ZrK2oTPwoRVOZaXLNPzAfYT/R2pFDT/VruOCaNdMM66merGAqt6lu+pMLkUemwxorPYHp4vmV/3rxcDlWGuRT6MPyvfJ1MUmUTZYhv3Yidkv3ENXO92DWPwLFlY41q2gRypQnWSf4WlebSEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLRC65P/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLRC65P/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so7929a91.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428511; x=1786033311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRB/SiR0fGbZN5o58GOzDdPoMAH3MpfMvsmzOVQc0i8=;
        b=sLRC65P/9RyCuXUqoFH9YchU2RicHKIs+vuloyN+1frFuaPuz/69RMaVNLoYe4YjNp
         8m2qoFUAFQ4jKqVjAaSAmSE5PibGTjkfSfT9Kf6xTLlc/jLYOpjJC2hHK+7gSYTKMJcB
         0igjoSCQ/JsS8H3Avw36VhjWe97zKHf7Xa2HHuxjcmTSdpwS5neMR0zlbSo/VeCnnQ2L
         D3x8gXwPMFi8TDdyrvpz3bBDYyYrZmstA6/BRpKN00ntp1tIfJCAvby2e60eIQ/Vg+RF
         Ql6s4Ytn0jBudmcwICtTm1ITsbiprhsYm8cn7K7wpA9pOgm3h+nuAsRu6p5CGSFnrGrn
         PcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428511; x=1786033311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRB/SiR0fGbZN5o58GOzDdPoMAH3MpfMvsmzOVQc0i8=;
        b=ny+u2ttA0K8lJgndK2J210rnkGFMmnX9kzCtxJcaVdUJm6xDfb5Ty6dRQ/x9jk8dV6
         raWxTF2fOFuwLxgOA2g9+w0saQzk1qUvpfCljQoQ8m2U6TVBih9mZwDlUx4aS46/bIUt
         YXdPJ8mwDSW3x6wUPuszAJHehudUYWpgX2EV4ROuzab/01Wc7Uq8PNfhQzFbWXmc60vH
         K0o27o18kMaRDxMIGLZCMKG6ED8fSG5LKmIUIZhORqvyFB/KBqPFhth0haHBXSE+dLLw
         bFITxkCnPCWVqSDscCMICWUdMJJEaLpjgD7UXtWHBbYJ+P1iJJMZGj0iJv6jRNZbKrSO
         nFgA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj4Xl+P3uF1+sEbOEAp5cVomZ46ekdj2oT5JwWkF289U/V3BIV3dFjEpwdKyaTOpZJmYuRXUaUnSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhAvFKSiLCoNNsSxBW6owLl1CyEcbpGTZJmEWXdIVHa3hkSHy8
	24xOXx9kIVLUtgnWuiQC7eDuc2vZjsXcmRzXBBMeK1GuyGtC5rEyezoT
X-Gm-Gg: AR+sD10qx1KD+EtBmGdhQZqq5Qu+k3ZjZjAz8+mTLDreHaSnTsm/dIcrY9P8V3W6bPs
	eLEDDOOIvvCAXZD1yfrMboAA/i4dLot4kYVPF09BkfaZ1kSV7YHYCIU8yicYGUblavZbzi3erOs
	sz1wmf+Qqiaf7l1ev7FJe2Fh+zEcT0Yml/zaUH5MZWO9KsBzSsK1Jrh/BZ05jZiEXxB+AocHX0m
	BRD/o6mDeXaTdH8UbN9sSbCYSVrrTrQWGeO77lbSa0V5mEI+4eraM8PfN5j8NEy8mZlrevDfVZY
	LLL3iilC+1dnL7xiGNVPmJ0ve4HH4HDWvfNpkGKs7MRD1xBwHPOIKiiuGl8PTxQlXqkxiK8F5Tz
	mdwCsGMY/CmNFCSmcxDMl6aQo3i03UpwAFHK9ZbC3ECKwPytRgZbW7YqdIcILuPO7f5WMEWkaYO
	OZlTs24BSwFGVnC/Gn30MM1cciLml92da0rVwm12asw6yUYCQAqCXz4crzHq0AcxGbTdSlNYCtw
	Ow=
X-Received: by 2002:a17:90b:4c0f:b0:38e:91a8:fb85 with SMTP id 98e67ed59e1d1-38fa8200471mr765335a91.3.1785428511324;
        Thu, 30 Jul 2026 09:21:51 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:21:50 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 4/8] wifi: brcmfmac: cfg80211: implement PMKID_V2 and fix delay busy-wait
Date: Thu, 30 Jul 2026 16:21:07 +0000
Message-ID: <20260730162135.12278-4-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730162135.12278-1-shivesh@example.com>
References: <20260730162135.12278-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Implements PMKID_V2 for FILS fast-roaming support instead of falling
through to the V1 path. Additionally replaces a harmful mdelay() busy-wait
in brcmf_delay with usleep_range() to prevent CPU stalls.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 118 ++++++++++++++++--
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |   4 +-
 2 files changed, 110 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 0b55d445895f..7d7e5ececd22 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -3989,12 +3989,10 @@ static int brcmf_cfg80211_sched_scan_stop(struct wiphy *wiphy,
 
 static __always_inline void brcmf_delay(u32 ms)
 {
-	if (ms < 1000 / HZ) {
-		cond_resched();
-		mdelay(ms);
-	} else {
+	if (ms <= 20)
+		usleep_range(ms * 1000, ms * 1000 + 1000);
+	else
 		msleep(ms);
-	}
 }
 
 static s32 brcmf_config_wowl_pattern(struct brcmf_if *ifp, u8 cmd[4],
@@ -4364,6 +4362,104 @@ brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg80211_pmksa *pmksa,
 	return ret;
 }
 
+/**
+ * brcmf_pmksa_v2_op - update firmware PMKSA cache using the V2 list interface.
+ *
+ * V2 firmware (revision 12) uses a versioned flat list structure
+ * (brcmf_pmk_list_v2_le) rather than the per-entry operation model of V3.
+ * Each entry carries FILS-specific fields (raw PMK material, SSID, and
+ * fils_cache_id) in addition to the basic BSSID + PMKID pair, enabling
+ * FILS fast-roaming on devices that do not support V3.
+ *
+ * @cfg:   driver config structure holding the shadow V2 PMKSA list
+ * @ifp:   interface pointer
+ * @pmksa: the PMKSA to add/remove, or NULL for a flush
+ * @alive: true = add (set time_left to no-expiry), false = remove/flush
+ */
+static s32
+brcmf_pmksa_v2_op(struct brcmf_cfg80211_info *cfg, struct brcmf_if *ifp,
+		  struct cfg80211_pmksa *pmksa, bool alive)
+{
+	struct brcmf_pub *drvr = cfg->pub;
+	struct brcmf_pmk_list_v2_le *list = &cfg->pmk_list_v2;
+	struct brcmf_pmksa_v2 *pmk = list->pmk;
+	u32 npmk = le16_to_cpu(list->length);
+	u32 i;
+
+	/* npmk here stores the count of valid entries, repurposing the
+	 * length field of the shadow list as a counter.  We convert to
+	 * the wire format (byte length) when sending to firmware.
+	 */
+	if (!pmksa) {
+		/* Flush: zero the shadow list and push an empty V2 list. */
+		memset(list, 0, sizeof(*list));
+		goto send;
+	}
+
+	if (alive) {
+		/* Set: search for existing BSSID match first. */
+		for (i = 0; i < npmk; i++)
+			if (!memcmp(pmksa->bssid, pmk[i].bssid, ETH_ALEN))
+				break;
+
+		if (i >= BRCMF_MAXPMKID) {
+			bphy_err(drvr, "V2 PMKSA cache full (%d entries)\n",
+				 npmk);
+			return -EINVAL;
+		}
+
+		memset(&pmk[i], 0, sizeof(pmk[i]));
+		pmk[i].length = cpu_to_le16(sizeof(struct brcmf_pmksa_v2));
+		if (pmksa->bssid)
+			memcpy(pmk[i].bssid, pmksa->bssid, ETH_ALEN);
+		if (pmksa->pmkid)
+			memcpy(pmk[i].pmkid, pmksa->pmkid, WLAN_PMKID_LEN);
+		if (pmksa->pmk && pmksa->pmk_len &&
+		    pmksa->pmk_len <= WLAN_PMK_LEN_SUITE_B_192) {
+			memcpy(pmk[i].pmk, pmksa->pmk, pmksa->pmk_len);
+			pmk[i].pmk_len = cpu_to_le16(pmksa->pmk_len);
+		}
+		if (pmksa->ssid && pmksa->ssid_len) {
+			memcpy(pmk[i].ssid.SSID, pmksa->ssid, pmksa->ssid_len);
+			pmk[i].ssid.SSID_len = pmksa->ssid_len;
+		}
+		if (pmksa->fils_cache_id)
+			pmk[i].fils_cache_id = *pmksa->fils_cache_id;
+
+		if (i == npmk)
+			npmk++;
+	} else {
+		/* Delete: find by BSSID and compact the list. */
+		for (i = 0; i < npmk; i++)
+			if (!memcmp(pmksa->bssid, pmk[i].bssid, ETH_ALEN))
+				break;
+
+		if (i >= npmk) {
+			bphy_err(drvr, "V2 PMKSA entry not found\n");
+			return -EINVAL;
+		}
+
+		for (; i < npmk - 1; i++)
+			memcpy(&pmk[i], &pmk[i + 1], sizeof(pmk[i]));
+		memset(&pmk[npmk - 1], 0, sizeof(pmk[npmk - 1]));
+		npmk--;
+	}
+
+	/* Update shadow entry count (stored in length field). */
+	list->length = cpu_to_le16(npmk);
+
+send:
+	/* Build the wire-format header and send the full list to firmware.
+	 * version and length on the wire reflect the actual byte footprint.
+	 */
+	list->version = cpu_to_le16(BRCMF_PMKSA_VER_2);
+	list->length  = cpu_to_le16(offsetof(struct brcmf_pmk_list_v2_le, pmk) +
+				   npmk * sizeof(struct brcmf_pmksa_v2));
+
+	return brcmf_fil_iovar_data_set(ifp, "pmkid_info", list, sizeof(*list));
+}
+
+
 static __used s32
 brcmf_update_pmklist(struct brcmf_cfg80211_info *cfg, struct brcmf_if *ifp)
 {
@@ -4402,8 +4498,8 @@ brcmf_cfg80211_set_pmksa(struct wiphy *wiphy, struct net_device *ndev,
 
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
 		return brcmf_pmksa_v3_op(ifp, pmksa, true);
-
-	/* TODO: implement PMKID_V2 */
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V2))
+		return brcmf_pmksa_v2_op(cfg, ifp, pmksa, true);
 
 	npmk = le32_to_cpu(cfg->pmk_list.npmk);
 	for (i = 0; i < npmk; i++)
@@ -4446,8 +4542,8 @@ brcmf_cfg80211_del_pmksa(struct wiphy *wiphy, struct net_device *ndev,
 
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
 		return brcmf_pmksa_v3_op(ifp, pmksa, false);
-
-	/* TODO: implement PMKID_V2 */
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V2))
+		return brcmf_pmksa_v2_op(cfg, ifp, pmksa, false);
 
 	npmk = le32_to_cpu(cfg->pmk_list.npmk);
 	for (i = 0; i < npmk; i++)
@@ -4487,8 +4583,8 @@ brcmf_cfg80211_flush_pmksa(struct wiphy *wiphy, struct net_device *ndev)
 
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
 		return brcmf_pmksa_v3_op(ifp, NULL, false);
-
-	/* TODO: implement PMKID_V2 */
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V2))
+		return brcmf_pmksa_v2_op(cfg, ifp, NULL, false);
 
 	memset(&cfg->pmk_list, 0, sizeof(cfg->pmk_list));
 	err = brcmf_update_pmklist(cfg, ifp);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
index 6ceb30142905..57167fde5ba1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
@@ -344,7 +344,8 @@ struct brcmf_cfg80211_wowl {
  * @bss_list: bss_list holding scanned ap information.
  * @bss_info: bss information for cfg80211 layer.
  * @conn_info: association info.
- * @pmk_list: wpa2 pmk list.
+ * @pmk_list: wpa2 pmk list (V1 firmware).
+ * @pmk_list_v2: wpa2 pmk list for V2 firmware (FILS-capable, firmware rev 12).
  * @scan_status: scan activity on the dongle.
  * @pub: common driver information.
  * @channel: current channel.
@@ -376,6 +377,7 @@ struct brcmf_cfg80211_info {
 	struct wl_cfg80211_bss_info *bss_info;
 	struct brcmf_cfg80211_connect_info conn_info;
 	struct brcmf_pmk_list_le pmk_list;
+	struct brcmf_pmk_list_v2_le pmk_list_v2;
 	unsigned long scan_status;
 	struct brcmf_pub *pub;
 	u32 channel;
-- 
2.53.0

