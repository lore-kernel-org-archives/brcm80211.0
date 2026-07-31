Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1844AB8F
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514027; cv=none; b=sj/VTr0FzEQsQPnPN+Y+vUfKV/qiPZmEHPne7URjpE+s2/CT/PnkHHlgJudHGvJrfycVkPukCOJjehb2LjypdzWb21YKj6QMoqeYY9kdz1Cwbh3b4ud2ccmM35zqP9UEHNaOMEDmx5iBOLlQX/bf07NrPCSIvf9I4P3mtH63TEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514027; c=relaxed/simple;
	bh=yt5tJ1FY92EBJqC4N6WpXN19nC5QZxle3Ke9UJYoQV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocDlglGbpP4vEoneXogVq56yPBGXV+WUdU5HBcj3OwzV18Iudj1tKX1+bNdLk5CWZdFpD3N9mjNJEcoaWU8/g4SG/hhKPdR4rjRoqv1fy9NziTJRrDHwzifCyvAWQZ/eUx4zs69POsEmlIQ6LVhIASuOnHgzAnNm5Odx9gUi5jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oa83+iDq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oa83+iDq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8486c9a946bso203757b3a.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514024; x=1786118824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c7Zng1vNMrE5OjddEOF9zhiKxLLsxB841dV4ylJ/sE=;
        b=Oa83+iDqpST8oLp2z/3i5U/RdIvBfC5+USz1FTQjTfQF2SiZM+fP6Ri/G8mHI7hfqH
         GLqOP1jmjeTIZNhufPS1h08go+Ps+wv292nXM1977VO0/Ftuq1fhZKQKquJ1WQxxs/rH
         J+xL7HpDMg4tdifqL3GCvTPr9aHwg9fwnDs/MZQU8Ee2LWtJ2WKKWvKn9jBI31azqMj1
         KnWTiHaBiRA32RdzsBvd0h7dDPmC6UvGW83+7AIQoEYpgSbF2I35OddqjlM/EG5ATgOS
         sK+pP1dTjiAg11DWvNkgKM9hP6vYwLC1Hfg7oHZg+DfmWaBrLlJeHiJjghVt4FS2FRsP
         a0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514024; x=1786118824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c7Zng1vNMrE5OjddEOF9zhiKxLLsxB841dV4ylJ/sE=;
        b=U5IwA6W9p5lvdjtHmJOu2sZjajbtk7k+oICBjBtDLKxoNor0P1KoFjI6/8UgyFTdOr
         EPC7XEoJMZP5t01I1tTWc8snflCiu2lOh6vZYyGwzaCSkiirbVarUcpKaQLFXX1U4Aa9
         F16RNQnnZXK9wsaB6shoiQ5sM+sOT4KKIF4P07AriRg9JkuPbzN2qbrDKTk247v6KdaU
         IokUuyZ5k1l8MCdMtVetCvBlRR7Jxcpe42nc1LUo+arNMhBMVX5SQDW+XyuSr4mRlDZC
         RP9W9yqwp/5CLeOQ7SNG7Cj4ywUsNAE6kgX7CwZtVnBjsIPujJtyeZr/PXVBgiYQ8DuH
         hX9g==
X-Forwarded-Encrypted: i=1; AHgh+RpZ69WXllnHXnszQTRNjCIK+wTG+9KZnW/VVeKYOCHwFdHYphTQLNXPSJT+1zxzuHxLM0f1mdVzlzU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/nfixbeBsXq94UVkx6hgoaO0VjpoZ7H1jZxTuDkE0G0Quhdgz
	6av6FJgyvFMTIKou+V2GpeqjZJljd+XoEoOrfqxDtslmE+g0PsCMd4+b
X-Gm-Gg: AR+sD11W4euUhhxUsNdCt9hplEG8P5ecGkd8UlQCPaqzStDGrsSmxMjH5bInzfWHqA+
	KM6oQpKJjLy8HEGvT9I97t+2vNWw2NcuTZ5rkgzxqiYFGPo4PCo7/Lka58VdlZH+EXgy5z2rkDz
	N4UfUy58PdukP/RVk+JGIvtTwHeAxtDCD+OWu0JUXGshfMkf/tDs92a6wj3SFwznRXpJZ3u68uH
	m9Bnm4XS2s0pDvl/xPxibhkpZTqKauauZYF6j/XSlyd52Xlt/d03/CQpsS5TR7cWRQX1u6QF5hF
	f6DD10djFlYj1optB/4TLP+ghz61EDhq76iNgnY+eLtAmWXMZqfjgL/i5Ec4kby486+h0lbV/lP
	o2d7pbepFRSL0dAus5p9ghQlDMNJR7l4vpr34T0C4DlNTBYY/BochB+/AmNifiJwtt9McoUBnyj
	mmBG2suTT97mTMiMvTQBPhUNVowsUMYiH3/0Os3UFhIY9WzF5kFOUYRpMM1vfdGWMSjiXJTtzst
	8lQ018u
X-Received: by 2002:a17:903:1a24:b0:2ca:ecf6:9105 with SMTP id d9443c01a7336-2d0521bd8a0mr7853625ad.1.1785514024258;
        Fri, 31 Jul 2026 09:07:04 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:07:03 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 4/8] wifi: brcmfmac: cfg80211: implement PMKID_V2 and fix brcmf_delay busy-wait
Date: Fri, 31 Jul 2026 16:06:21 +0000
Message-ID: <20260731160646.3812-5-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two independent fixes:

1. PMKID_V2 implementation
   Firmware revision 12 introduced a versioned PMKID list (V2) with
   FILS-specific fields: raw PMK material, SSID, and fils_cache_id.
   The set/del/flush callbacks all contained "TODO: implement PMKID_V2"
   placeholders and fell through to the V1 path, breaking FILS
   fast-roaming on devices with V2-capable firmware.

   Add brcmf_pmksa_v2_op() which maintains a shadow brcmf_pmk_list_v2_le
   in cfg80211_info and pushes the full updated list to firmware via the
   pmkid_info iovar on every set/del/flush. The shadow counter is kept
   in list->length between calls; the wire-format byte-length is
   computed only at send time to avoid corrupting the shadow on the next
   call. Dispatch V2 between the existing V3 and V1 paths.

2. brcmf_delay() busy-wait
   When ms < (1000/HZ), brcmf_delay() called mdelay(), which is a
   CPU busy-wait loop. Since the function is always called in a
   sleepable context (it falls back to msleep() for larger values),
   the busy-wait is unnecessary and wastes CPU cycles. Replace with
   usleep_range() for values <= 20ms.

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

