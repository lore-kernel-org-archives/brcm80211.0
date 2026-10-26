Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993019;
	b=qc560F0LY8KUYriLMd32iasCPo8KusvWOSQ6tRnuyqcPISsySAA0+FSTOs+/qEIJUi0T
	 UfrGc+Ce1d1uaN2v3tvAMTLeZOVVnOYUZ6Pp42I+2ZMlCIRX5dy53qlcvQ10Ec0xO6jGg
	 UoqTcYZaG3lOLVA+ahFW/XGlrGq7pp3ZF8xciTmNs0iBxHd4fAgMZu3teMd88UbUd3fG3
	 tNDEDBt7NfJGGUMvU6Wb4scHIvfuffWhYDit8ZE1pvNZ0CehZknhky75R8QtxFXYulRGO
	 cXsMkWnKQNLmsAUyMzLxYXRwagPg0RrhAG9m1aOBdTjK4UgnHRYQi5B7IJgH4DBw0Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
	b=OuyvsYBINaJdwRYbiJ9+h6qwRyZlm9rOgpO9mOnizOBxBjRRYEnbw2jSqtsHdVWfEqbv
	 Thmw8ZTPQL+En80HAgmdbY7vp5xq/indk98biRi3aCtEBuZIJ6TSWdKEeUs9CVaRRWVrA
	 +RYJqIghMOXeTFK/Ekj4Jg/FIzW/BQNNLOKsZUBlHUs/9lBYwIXqjdpq8IfvKQfKWLo5q
	 RJOmierjKHhlEMYJT8IoekSqn6bB6v1gvQbUy8XPCa89xFpgW5E1hZbo1iT+HJa0sfpw1
	 jec/5si6mZODz6BWANcNPjbwbwIu9Io2XdGbGcJfR74d0ce6VOZjvnzKddXgOgTKL4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BoxOuw15;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D06E606A326
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D06E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BoxOuw15
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070781f63so907105b3a.1
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993018; x=1793597818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
        b=BoxOuw156B/Yj4zAz0Fhm8LcEkIQlgXC+lMEC5y/HZyNDiEk8rLO/A0FbA1f2JaVx9
         PwgjC/i28vh4F9kLxGSOa8K8r34U1g5s9slzc3LJolpOpvTSwhFJQMQfAE6uKWPKMht/
         2MMUvOlEjNShVZ0P+CY97wAqQcXGiq4v/BsD2nnBGx+DtcTLLw2LOIe0hNOECOO98xe1
         kH5XLVuPB6DnG3orI1B/tT+/1d+LJ4ILqgI/wgtNLOO2pmapIJKCtzfBeX1ywxfLuuQH
         CyIM+r/IbO2RUACX8dPZpuQD93SXSvCAjkJuq3fEWigp4Mx5I3QzWZfvdnsrsLxfhLmA
         kh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993018; x=1793597818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OuNNgHAOVhz+FAVwYZqTinDyQukbU2g3tn+Bgg72Xk=;
        b=Mn9TOLV5YpNgpeoqJ9QVELjuqtOSyiFASkPvLPXtLWKyA0zxfolTutzTYE/4lTXEX6
         oneWe0Df8D9gmIhU5PCkaQXtGRy+YNNjvXe19yoNsjVrtRr9m6rHsJXbSsWuG2q/37Vx
         kz8YnDGaAk61c4aVeq1kVd66ua4H8kljpftAUKEWiCmHYuZ3aeuu52Pp7STqsxkX8sSy
         MFzCJ7xI/zF+bWqvN8+Uzpx2VjvBqAWaEL0/mgGqKVcX1jmW4juTpTu85OdEvW7jJ63X
         H3R7tJHJxqWNWhlDyd5CtWgXWIv3cnHbWghvIu8uTMpzmJiipiO540IQXAtB1wmHagHy
         iqNA==
X-Forwarded-Encrypted: i=1; AKwUvBwJAObYvreWfi95G+hH7RVVvfxxJ210kL50tzyGTmSqsqg9wxIz3/hvr/7GtXEi90CCI4OzugeTaFc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2VYWNGSjJBUK17mKb4THAhMwsC5tjS/4hZEwxEIWDS5TEZnwe
	n+ULFCkgaFOsd9EMg6mmwJ8z4SS+w0OhAzNpgfEbHW5kBnRdRrshEf1t
X-Gm-Gg: AYBFou0Eh7lZVxjP1oszX0iYe1S4Dd6H2ZcvGo7edKTW5Vg1GQCpxTVCZzJBxZIzLC2
	hciT0X9rNgVH5uiLErq5xFnNFF2FWT4SXEn20Cd9Nfkbznje646gJco3kmtQZnCGP2JeXPEblq6
	y7VIgZU1I6gEu1aDCxA0RkSkMpbQy3dGz9jWSe/5nBJCvKWDhwjp719qKydF7GzDTsC3St4bpfO
	Q1ILevbwZC2fPOczI6L8TI36GBVaKXjQFmN3P1hfk/f9tJgZlk46Dtmko0tNsCZQFUZz1Zy8uxr
	9WWv54QY/2CC96br8GL1gKY3LcWu3sFs4nNwaDXcppvycd0dn2Q8e7z01tDGduDklAF3LsNh6mT
	cK0pYhTAVlOkb0XWNraIQhKJ84s6ScVVfz2trk9W8Za78ohcUpKOPFPoOztRNaGGwuEVM2sg3HL
	EqfGn8pDFeQAg+yJC0Bie+9yGgw89iRlAvJMnrnJOsstA5q6u6Trdge29oAwWn13j/hAvzN4IGO
	2hIeZJoRSBSYx50IyEBwcHajkcwJYO7myXiPr8RnKuzzn59kHLKEka2QSQhKde/lO3WaUX0t0qy
	Y6UR
X-Received: by 2002:a05:6a00:301e:b0:8a0:5d8f:6675 with SMTP id d2e1a72fcca58-8a369c1e10emr4233130b3a.58.1792993018446;
        Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:36:58 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 03/17] wifi: brcmsmac: look up OFDM rates in rate.c
Date: Mon, 26 Oct 2026 13:36:09 +0800
Message-ID: <20261026053633.361454-4-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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
index 7eae73ef7..d519e950c 100644
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
index 7ffff7f51..c5aaaec43 100644
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
index 6841bc005..ac577c8e8 100644
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
index e178b1a0e..7c1d43323 100644
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

