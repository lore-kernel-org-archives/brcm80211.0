Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759986;
	b=PRz9wv4aY3fyjvNEQu7M0CfOmPweFMzzCGtCyJt6XaPF0sEzYUfoIylKp/v5KvkHjMZP
	 SKfkHz8/AAxgIuO7TJEHw7Yj6aW/lsC72Pf/+5aS7Vfw3vn3GKPDNKGxfGWdO47A0hi6U
	 PYSHN1iBe4GNN7Z7Mqad8KuLdsXAg7MhiQQahqeWm2E4QGUVSC0+edBCeWCUqe1RIA0G/
	 53cXqYT6AlrkESzAHNo+1OJy6i1cTk/fVP7LiCFnwTvfua8FSBM+RM8Wmbe2twK/xVulN
	 YVeTT1RqQ87RfhkWRY8cYDMH1KbyCVmtx0jt4bNEmf0fw/JYchkcOF1w97M32uIQjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
	b=edRiyGJm5VjZp+V+oD8x9uJD1kl/otIIM55x56pgoqdQpS7YL8Wal07d/gvtDgXtjvvw
	 e8aUVEK8k+mRLCTJmOJQX2qtUIfUHIdrb/9OCOsQGZBRo5agZ16IPDzOoiX/XHpPewlJc
	 5MyhhcFhcEIwq1iHWpV3GQwi6bfHqtQIw8vMGVogOhVEGOHR7fTUDtB8s8rl0+D267zLN
	 +QyCGV/qwq1oazWMD3EIC5PEvYOphF2JPd+4O0P0fLKv3UStH7/+nw5YyziItM6Cze4do
	 biSELfiyPF4CK+Ck0cFzSWB6v/Vd6PvQ6Ke1RJWNdwqJ7e2GkRsSik88Zra3Cbv0fIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtRLNlTi;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E8606A323
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtRLNlTi
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso6828286eec.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759985; x=1796364785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=QtRLNlTim+w6aZYkInJHi3KavmhPNI7sumG5SGQLmsjEBzRgcmbR9SfSx4ylMwSVVo
         8eEoKvnNEUVpHAMBzWLN4kOS585LeLf2tFUal6ZBwsIeyY+4RhGpH79+/bHd9NK2T5G2
         bkd+s2HSeCTBiqtPAjOOJkGc4tXi+9AdxJpe42A7vQhAsywQ7rpKrlJJZ+jUAajOtrG1
         5zTjmc9y213cOwvOEni6WcUSU23bjdMECJo/PdZsLb3G1IyZsBZtSGtS2kwJwOCYQ+K4
         /6QdLZm3skrxj/2lWt4/7oqcJoblFLEugkd8UyZHna2FOWRGFhl446Wc4be9ehmzZVn3
         FRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759985; x=1796364785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6s5EG8cJ/T3odvc7pqRCLvrVKTXrFbJQqMyd2LrHmA=;
        b=Tx56TRkJBtofjhGWBv2oEmtVC3lkyMtP9aR0mBffZYo7k2VQdLF738nD0/ZrIEdqko
         Tp/kwKM0EhTXH0U4BAyO9R1vqRnwdrI0Ey56i2X836g99KOo3q5OlBpqeNEqlEu9rwfA
         Jqxr/v01fX82jlxWhShGEzZ9qrMHEkbDom4Lf4EtzL0R6nM25Ig6Uh12SS3UZfvz1z7F
         ndZfhBRxZtinnDkKX2Zs1usIcRpfKdI9Srz0miwF+oSm4JRzbOfT6lgJdmiPswhHaGZw
         2noPhFJHsg75TFOZuv6N2eSygsYxT+FQ+SOPQT+wj4C/nwnZjp5d3/fSa7s9xm2JWoDN
         f1mA==
X-Forwarded-Encrypted: i=1; AL+hErEcTO8YxRCViMUgWWI21GfY4VBmqAJdsmBF3dniCCSWRw6utnPMOqdr7qR3YL52gsj5CDKE6eKy5rQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8kkvbX9EAxd2sHNNK7abIjW5uZNb6A2AIwPAxnsFuPPRXeRGm3
	59G/Tecpjt1H/+HVVbO00eNhkL4kP1AE6TE+0UD5Lhpz101HYglTWXqS
X-Gm-Gg: AZFdTZe4GoVbCN7U7GfAozOnFRqVlNUbOqyfATFVs7O40h+hEAf2wpe61M3zLcX8z/t
	lzp7gkkVJW7tt5whyznNqj1sf2G1ZG8DwP/csE8jOzTMTQ3SxndqorezUjJ45anT+O8RXK8ssGs
	GVBRbpgD7wuBidGSYuAt2hfrWiBIcoKZ+OluaN0ZQIr3RXwvucJMygYHkKBpO1sJovzeDG+XpGO
	O2gm+zEovGN1rMahv8iSJq3jQpIk1lZktpV39XLrGZyJDlYvg7Z5G+17CUMmFIs9bD1BVj+M4Mz
	uwcthcAaXI9YoI6dI4LRN1lAgid+ftybZpaNH336KnnjOayLDLnhyKGi0+N7oCkp1sFVx1Yg3NR
	3ZH2s6MWmmG3TQfXR8iL6aft1QTkWEzc9utCS6NWbTPVVr5Iky1DG2db4FWd3+1grq/RhKwLvAd
	CYD82C4pT7QKD9T+nffYEPjZURcsMSBfkUMHC2zXLZJUl2kv0I9IUNQRx0tMBPLSiZxY9HBNth9
	N/8/uGyI9X/GeE7wKwZMtoFs0qmCH3A8LTHXvd0Mzyia7uIySleEhDjhaAsoP9t+9NDjCN9rGUF
	tmcszwCCg1e83EZp5OyJl5xBttDafskB1/iXTCa0na8JMHGRdEaNkN8b6aQzoqln63MDJw==
X-Received: by 2002:a05:7300:ce81:b0:384:a3c5:35b8 with SMTP id 5a478bee46e88-384b3986ee5mr27744207eec.8.1795759985522;
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:05 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 03/11] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Fri, 27 Nov 2026 14:11:33 +0800
Message-ID: <20261127061147.506129-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

Move the OFDM rate table next to its only user, ofdm_phy2mac_rate(),
which leaves rate.c independent of the PHY code. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c | 17 -----------------
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  2 --
 .../broadcom/brcm80211/brcmsmac/rate.c        | 19 +++++++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        |  7 -------
 4 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
index 7eae73ef7e..d519e950ca 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_cmn.c
@@ -101,18 +101,6 @@ static const struct chan_info_basic chan_info_all[] = {
 	{216, 5080}
 };
 
-static const u8 ofdm_rate_lookup[] = {
-
-	BRCM_RATE_48M,
-	BRCM_RATE_24M,
-	BRCM_RATE_12M,
-	BRCM_RATE_6M,
-	BRCM_RATE_54M,
-	BRCM_RATE_36M,
-	BRCM_RATE_18M,
-	BRCM_RATE_9M
-};
-
 #define PHY_WREG_LIMIT  24
 
 void wlc_phyreg_enter(struct brcms_phy_pub *pih)
@@ -2486,11 +2474,6 @@ u8 wlc_phy_stf_chain_active_get(struct brcms_phy_pub *pih)
 	return active_bitmap;
 }
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void)
-{
-	return ofdm_rate_lookup;
-}
-
 void wlc_phy_ldpc_override_set(struct brcms_phy_pub *ppi, bool ldpc)
 {
 	return;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index 7ffff7f519..c5aaaec434 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -234,8 +234,6 @@ void wlc_phy_ofdm_rateset_war(struct brcms_phy_pub *pih, bool war);
 void wlc_phy_bf_preempt_enable(struct brcms_phy_pub *pih, bool bf_preempt);
 void wlc_phy_machwcap_set(struct brcms_phy_pub *ppi, u32 machwcap);
 
-const u8 *wlc_phy_get_ofdm_rate_lookup(void);
-
 s8 wlc_phy_get_tx_power_offset_by_mcs(struct brcms_phy_pub *ppi,
 				      u8 mcs_offset);
 s8 wlc_phy_get_tx_power_offset(struct brcms_phy_pub *ppi, u8 tbl_offset);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 6841bc0052..ac577c8e85 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -266,6 +266,25 @@ const struct brcms_c_rateset cck_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
+static const u8 ofdm_rate_lookup[] = {
+
+	BRCM_RATE_48M,
+	BRCM_RATE_24M,
+	BRCM_RATE_12M,
+	BRCM_RATE_6M,
+	BRCM_RATE_54M,
+	BRCM_RATE_36M,
+	BRCM_RATE_18M,
+	BRCM_RATE_9M
+};
+
+/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
+ * increments */
+static inline u8 ofdm_phy2mac_rate(u8 rlpt)
+{
+	return ofdm_rate_lookup[rlpt & 0x7];
+}
+
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index e178b1a0e2..7c1d43323a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -198,13 +198,6 @@ static inline u8 cck_rspec(u8 cck)
 	return cck & RSPEC_RATE_MASK;
 }
 
-/* Convert encoded rate value in plcp header to numerical rates in 500 KHz
- * increments */
-static inline u8 ofdm_phy2mac_rate(u8 rlpt)
-{
-	return wlc_phy_get_ofdm_rate_lookup()[rlpt & 0x7];
-}
-
 static inline u8 cck_phy2mac_rate(u8 signal)
 {
 	return signal/5;
-- 
2.53.0

