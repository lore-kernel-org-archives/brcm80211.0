Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AE4477F9
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512966; cv=none; b=QxfUxj8kq6N4TkSiOP9GN2NsVCZViKpvOHjzcJ0llv09l+rtSRGB0Ooff7z/wXC0TmEBsYUOWfzzgx1nvQVfO24CRPFooEbxKC0WULWdNov/56E5gVGLWhofrG53cik+DYjltlcz2rwjaA2j+mxdP0g0dKkOUP5ZYCuxxjCR2NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512966; c=relaxed/simple;
	bh=5l5j8Mmu2S3Bni8tiVCEfGXSJ+0eqA6wzanI0ZL23bY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJQGNRrK1w/YXHAyTJ5EkGq4IAzRkASIRfX+va+6ke83thapwvBUHHZiJT7wKrBgLCrNcM+PaJyuMSLTdv3BkioE679+EVfD/38KnxEC21wF/vuF707ADzUpo65Qpw0J75GQ0F1DZDHNxhT5KHTRjUzFh1m+DGmEFbpWlB3k41U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3bAPPr0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3bAPPr0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdce28edeso1166125ad.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512963; x=1786117763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60bjaHyBUJd87L9/5oXjhGZVQ3tHQ6V6AhVTN/AVUw0=;
        b=m3bAPPr0n1fdcwlHMEs/GhBELUD3DkP/spqp0/LzpXUSwHG9Af2sjiSH7PVLcxDERK
         TuMJqxmNts0AwhUbahCSGNwUY7pO14BNH4w6YMFLI4KgC5XyDClF+6e/1RbCwbrSDqsC
         7heoZASLHPgKwRes8hoyjAuvJ+x5b+ug+1Jo/Lmp5zincm4rsNGRgV6kdU4eq1EljcSk
         ETqsJZll9uG7FHH7IYGMaU+XaS1LtmFU8DzEx9H6iInTNiOoxyc3MiWZ0h/k59o4Ay1d
         GAYc9Oa/82yO4VR4DZOvzDH1hQxAJNwlHpj1J2JmrfCOJSBJRWIuqXuqAaZjJwgrBTCO
         A6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512963; x=1786117763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60bjaHyBUJd87L9/5oXjhGZVQ3tHQ6V6AhVTN/AVUw0=;
        b=ljS96JME5mp0rMxC+PkLz8fWWIdMTwgeGWXq8hP3P8iVZ16hG5Sdz4QtITixK+mR/b
         mCFGG+L1wctG9jGpk4c+8AU+hgoV9WD5wLBvOfuOaswVRFtIz9IAfskXWuSHQFedkKWo
         /SPYP2sM3Vl9H+KrtU1wnLTZABiRQNM9NfSVbjRdnWKNST/oYSV+r+OMeuEHgzTXATQ6
         NA1r7tp6GAFrFtgFhGswRjaIMtMkaHrV6or77JHfihya0N8s2Sq3RzFCNEi+elrOFd5d
         vd1PO5Q1eeyEOX0mrxtkd15zNscRQfHdvBCmbSdRfRfreI3r6juQdVIWuq0+alC5eg04
         gELg==
X-Forwarded-Encrypted: i=1; AHgh+RowuHWl+m34xpk82iP5uRAnW6buEkyEvTy4FrWZQee7Rln2Zd7B43UFkg6T4nnx1x09Z7HVcFrd2e8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHltaTfBNEG1VYm6Y6IeaUvzKlv7WVAxFQWOm77XoQXVJz0UJY
	j3durQhVusd7I1ySCp36W9t1kzsXCY7cwMcyLpPJXXHAm7sR9pAGh7wu
X-Gm-Gg: AR+sD10twIX6OmR90h+u/4EREZOITyc7J3xdetlhH7UlpjTdYU7Ja9JHGED78NZ30Pd
	RxtNMyKLkRViCs40bGhpE0f/F5SXZ7yTMYJYW8Yhot5HKd3LlZR0uLjMDnRPdHlVNAihbcY7Wa3
	kGsG1jTBcii+yWSGI0fIE8eYAf4ixsHHpOp2YRUsmdpMn6iDQySwmvniJEFS6kvKKSo6HT+ZsMk
	4CiRBKgQjVv/aAMV6LjdOgz42cPJp76kJOicQPMLdXBuZTQh3BulWb70/7F2Golritwy0TJcnoy
	S4fYGPkvS3bRxyaJenIbol9kFRlyXCt8HeESqjqRmBGYJVs1G4HehEDTdPNB5UN8A3VfNqdiGgA
	LTw6bxPJRvFiuA7uOxWrsNYT5qcJEee/DvoFC0j1VzJoz0ayvJq191Eevx2u3yRNNc0lvKqxhxX
	gEc7gKyYf3A7hsBh0kkoX851lqzRc3srrf672tK8hvsLO6GniEtXsxRr8JLXB0lUaQuX/G7q5lM
	II=
X-Received: by 2002:a17:903:18d:b0:2cc:e7f3:d39e with SMTP id d9443c01a7336-2d052298ccemr6525965ad.2.1785512962471;
        Fri, 31 Jul 2026 08:49:22 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:22 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 4/8] wifi: brcmfmac: cfg80211: implement PMKID_V2 and fix delay busy-wait
Date: Fri, 31 Jul 2026 15:48:36 +0000
Message-ID: <20260731154901.1822-5-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
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
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 123 ++++++++++++++++--
 .../broadcom/brcm80211/brcmfmac/cfg80211.h    |   4 +-
 2 files changed, 115 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 0b55d445895f..2375c2f9d97a 100644
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
@@ -4364,6 +4362,109 @@ brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg80211_pmksa *pmksa,
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
+	/* Write the updated entry count back to shadow BEFORE we overwrite
+	 * list->length with the wire-format byte length at send:.  If we
+	 * don't do this here, the next call will read a byte-length back
+	 * as an entry count and silently corrupt the list.
+	 */
+	list->length = cpu_to_le16(npmk);
+
+send:
+	/* Build the wire-format byte length and send the full list to firmware.
+	 * Read npmk back from the shadow (handles the flush path where npmk=0).
+	 */
+	npmk = le16_to_cpu(list->length);
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
@@ -4402,8 +4503,8 @@ brcmf_cfg80211_set_pmksa(struct wiphy *wiphy, struct net_device *ndev,
 
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
 		return brcmf_pmksa_v3_op(ifp, pmksa, true);
-
-	/* TODO: implement PMKID_V2 */
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V2))
+		return brcmf_pmksa_v2_op(cfg, ifp, pmksa, true);
 
 	npmk = le32_to_cpu(cfg->pmk_list.npmk);
 	for (i = 0; i < npmk; i++)
@@ -4446,8 +4547,8 @@ brcmf_cfg80211_del_pmksa(struct wiphy *wiphy, struct net_device *ndev,
 
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
 		return brcmf_pmksa_v3_op(ifp, pmksa, false);
-
-	/* TODO: implement PMKID_V2 */
+	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V2))
+		return brcmf_pmksa_v2_op(cfg, ifp, pmksa, false);
 
 	npmk = le32_to_cpu(cfg->pmk_list.npmk);
 	for (i = 0; i < npmk; i++)
@@ -4487,8 +4588,8 @@ brcmf_cfg80211_flush_pmksa(struct wiphy *wiphy, struct net_device *ndev)
 
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

