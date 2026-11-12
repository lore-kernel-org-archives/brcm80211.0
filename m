Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460343;
	b=cDPzKqVF63Wl5FKPVWACU/rB2myo+UK0GfTxnyLOaosZre9WEytArU32pRGaSxJcTkqV
	 XLMYXsH8HyrfdflW49UR7S4xHWCbZAEIGjziCg2Yjw6Y2dlaTtb5M3cMd/VS+SuMfLuSa
	 Wogd+HNL361OlFq/pj0LQB8iDdor9LvtA43e8PVWTyVxYn1bH+Y5O+CRRz/axyOX4uK4i
	 jH0DDcMhY0EFNW66VcKDe3HBcLpFlJxKNfClW24isCOVtEyDHQi4+ZlTsGm7UIyb0AYld
	 dn/PmW8MjmU/q1PGKHqSzSbnc28PB/6Uc8z9G/7PZ66PlFVr0adQoQgXiqs8YOxPGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
	b=VCH8xlFZ4U4EZEptWauu1ZA+Rcu7ihV38mQGPvEpNEd2BMNma1iIvlwV6lG9jJZycUtg
	 7OxhZDzceQndQJjhIxdWoBtaiIFgpzZDn0dD5rbW4KSQvnRJo1jpq40dpoCDzq8sKXaWo
	 Fq1FXVGfw4918T/wEMt4WkzpHQFhmOejZx3S6qqk7DzZt7EqpxBg78PkpXbBMG6bplH54
	 ah1AvzkCwIdOElXOLnMsT6WKkgNcHg940n3+OZ7a1/eYoVVBZRfzJ3I4biq7wV8DGCpE3
	 SllJiPIhgCPT/MlhNoY0n8F4ktQpUSS2kuyzNjpldVqzilnnFIGu+2jKZPYvHPwMO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTRrAQVp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC12606A88E
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 05:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC12606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTRrAQVp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso3471687eec.1
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 21:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460342; x=1795065142; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=bTRrAQVp9g9YgcCEc95YTdXpUUwgHJJIHzyhr3Ao1mzT1WXbhQmReARYRZl74lF+ki
         xXy+uALN1LlwfUtWSbphFW81hqALPEtrquOlfQT7SDLmRNo206X9MUQzk+gHR1AC9kzm
         yMn5ujMbPUaDcMFGSGayfkEAfLgUTCSgyAiKU5lKvYoYXN7w4682PGRME8cLZs1fsubB
         vMGzSRg69Bnx/1hbQwc2bKYc241Ny0UvtyS0nEdu0s7KxSe4Wl+N2LPbSNPwhPVUiI4G
         Zrn78rnUzzWKFxxEt7Fxb/sGwXDXS7zS1Hd4vv2YDcgIU7FQCJdYVswCOEiXWNs16Oy6
         ncww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460342; x=1795065142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=wWhFEofw2N5LTM7h/r4u29FK9SmVmMBjUCLTn747dSafCOezinE0FkUQFd+BoS5Xdk
         DnmPSRVMJvJjuK1xu6Bs8gZD+aJ0+HKO7ct9Ts9Rn/ZNFSGjbTs2jCI0YCKQJ8j/1Mt3
         egXlIRFbWpIBLxOUOxo8ECrnSyNunj9s1+XJgR71my/yKS1vsq99cW43ezxHJfQWds47
         nuWkaIyzJfMCYqpWBYUbavhNt3WABtbM9CdD1sAAO+JAFQnjlA0svzXjsylhfVLQm0IL
         NxqXd6S9BbOxiv2NPcfsbL79Py70gtEJbBiExGg9vLoLiShjbSV8IqjUcQzg8npNp5Ph
         K59A==
X-Forwarded-Encrypted: i=1; AL+hErENw6V87lwcJ8vnPjAN/QCT6izoFkf429NjbTAJMfMLTwApcyWDGnQcUmX8XVSDuP2ZykIksxn//D4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+oW+VAjZJswy/7W8ZBCz1U+V1xYEG0PxG8dmHJ9XWcgJxsc4gY
	KRcsxz1WH750oTr3ui3vjOO9i2AeQCeqgufcT7tcwvh+sOWLhS3IPa4p
X-Gm-Gg: AYBFou3RymLFu6HOS6LivKaatVDMUZ6Xpc6eQ7g8U+stA5iHZHxPephFtoB/c59vqem
	hwQW3E4imaJYuXgd3JaKEo12D0oh5+K1XNYZRht+14y4DyASEtRWPK/q1RfWeBKkFtVQTIbzkbV
	3UXoa3hwhd7OwA1qqKGE2Sk+eJsEWiFLNDc6F8skLN+979qwIuDZDfHlkYvntWFk/xjexzHEfGG
	QVazDM29Kw5fcTMutoqZCL/ECuUPtkBamZ8sAmNViwc9ZkSYlpWr8T9XpuaXtcb/mQESAR8Q7v6
	al6d1yglVnyqQ/OMI3wiByFGny8XRPG6XhRuTgoCwLNFBXlXvFnPS1jm3dB4GHNt3pxgI/lCMUS
	AauZtxLoTEq1QQLZcRBuH5RcEFrQBiulJxbGzLd4CcF5dwL24BUEp0QqRFYRs6gk9QYJ4Wyykc6
	SHDyyIdZN+rA2LY/dW78hyByfw2xDBjF/R8apu9S0FRBy0ADIt9j4hUdwcZaJBl7cqX6F82aJkk
	nYB46sfzgH1RImZF6uQpEKUHo8AXvGJoBE2lNuMnpHvntArKHPRbAl+kyr5LPMgSM5IlmSoafm6
	u/CrFEAUKeOZxHl+Y/OX9EMDjgpqOiFHI4L+F7kf4iPyDOGcFnx3FoU=
X-Received: by 2002:a05:7301:78c5:b0:375:4f3e:643d with SMTP id 5a478bee46e88-37686d3432amr4544155eec.27.1794460342131;
        Wed, 11 Nov 2026 21:12:22 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:21 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] wifi: brcmsmac: move the RTS rate selection to rate.c
Date: Thu, 12 Nov 2026 13:11:35 +0800
Message-ID: <20261112051142.2797529-9-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

Move the RTS and CTS ratespec selection of
brcms_c_rspec_to_rts_rspec() to rate.c as brcmu_rspec_to_rts_rspec(),

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 62 +++----------------
 .../broadcom/brcm80211/brcmsmac/rate.c        | 49 +++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        | 10 +++
 3 files changed, 68 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index cd80155a5a..4be0bb085a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -325,13 +325,6 @@ static u8 brcms_fifo_to_ac(u8 fifo)
 	return fifo_to_ac_mapping[fifo];
 }
 
-static u16 frametype(u32 rspec, u8 mimoframe)
-{
-	if (is_mcs_rate(rspec))
-		return mimoframe;
-	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
-}
-
 /*
  * Detect Card removed.
  * Even checking an sbconfig register read will not false trigger when the core
@@ -6164,15 +6157,15 @@ brcms_c_d11hdrs_mac80211(struct brcms_c_info *wlc, struct ieee80211_hw *hw,
 	txh->MainRates = cpu_to_le16(mainrates);
 
 	/* XtraFrameTypes */
-	xfts = frametype(rspec[1], wlc->mimoft);
-	xfts |= (frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
-	xfts |= (frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
+	xfts = brcmu_frametype(rspec[1], wlc->mimoft);
+	xfts |= (brcmu_frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
+	xfts |= (brcmu_frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
 	xfts |= CHSPEC_CHANNEL(wlc_phy_chanspec_get(wlc->band->pi)) <<
 							     XFTS_CHANNEL_SHIFT;
 	txh->XtraFrameTypes = cpu_to_le16(xfts);
 
 	/* PhyTxControlWord */
-	phyctl = frametype(rspec[0], wlc->mimoft);
+	phyctl = brcmu_frametype(rspec[0], wlc->mimoft);
 	if ((preamble_type[0] == BRCMS_SHORT_PREAMBLE) ||
 	    (preamble_type[0] == BRCMS_GF_PREAMBLE)) {
 		if (rspec2rate(rspec[0]) != BRCM_RATE_1M)
@@ -6418,48 +6411,11 @@ u32
 brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 			   bool use_rspec, u16 mimo_ctlchbw)
 {
-	u32 rts_rspec = 0;
-
-	if (use_rspec)
-		/* use frame rate as rts rate */
-		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
-		/* Use 11Mbps as the g protection RTS target rate and fallback.
-		 * Use the brcmu_basic_rate() lookup to find the best basic rate
-		 * under the target in case 11 Mbps is not Basic.
-		 * 6 and 9 Mbps are not usually selected by rate selection, but
-		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
-		 * is more robust.
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate,
-					     BRCM_RATE_11M);
-	else
-		/* calculate RTS rate and fallback rate based on the frame rate
-		 * RTS must be sent at a basic rate since it is a
-		 * control frame, sec 9.6 of 802.11 spec
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate, rspec);
-
-	if (BRCMS_PHY_11N_CAP(wlc->band)) {
-		/* set rts txbw to correct side band */
-		rts_rspec &= ~RSPEC_BW_MASK;
-
-		/*
-		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
-		 * 20MHz channel (DUP), otherwise send RTS on control channel
-		 */
-		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
-			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
-		else
-			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
-
-		/* pick siso/cdd as default for ofdm */
-		if (is_ofdm_rate(rts_rspec)) {
-			rts_rspec &= ~RSPEC_STF_MASK;
-			rts_rspec |= (wlc->stf->ss_opmode << RSPEC_STF_SHIFT);
-		}
-	}
-	return rts_rspec;
+	return brcmu_rspec_to_rts_rspec(wlc->band->phytype,
+					wlc->band->basic_rate,
+					wlc->band->gmode && wlc->protection->_g,
+					wlc->stf->ss_opmode, rspec, use_rspec,
+					mimo_ctlchbw);
 }
 
 /* Update beacon listen interval in shared memory */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 1c0259139c..fce98dd4d7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -903,6 +903,55 @@ brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 	return dur;
 }
 
+u32
+brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			 u8 ss_opmode, u32 rspec, bool use_rspec,
+			 u16 mimo_ctlchbw)
+{
+	u32 rts_rspec = 0;
+
+	if (use_rspec)
+		/* use frame rate as rts rate */
+		rts_rspec = rspec;
+	else if (g_prot && !is_cck_rate(rspec))
+		/* Use 11Mbps as the g protection RTS target rate and fallback.
+		 * Use the brcmu_basic_rate() lookup to find the best basic rate
+		 * under the target in case 11 Mbps is not Basic.
+		 * 6 and 9 Mbps are not usually selected by rate selection, but
+		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
+		 * is more robust.
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, BRCM_RATE_11M);
+	else
+		/* calculate RTS rate and fallback rate based on the frame rate
+		 * RTS must be sent at a basic rate since it is a
+		 * control frame, sec 9.6 of 802.11 spec
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, rspec);
+
+	if (phytype == PHY_TYPE_N || phytype == PHY_TYPE_LCN ||
+	    phytype == PHY_TYPE_SSN) {
+		/* set rts txbw to correct side band */
+		rts_rspec &= ~RSPEC_BW_MASK;
+
+		/*
+		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
+		 * 20MHz channel (DUP), otherwise send RTS on control channel
+		 */
+		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
+			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
+		else
+			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
+
+		/* pick siso/cdd as default for ofdm */
+		if (is_ofdm_rate(rts_rspec)) {
+			rts_rspec &= ~RSPEC_STF_MASK;
+			rts_rspec |= (ss_opmode << RSPEC_STF_SHIFT);
+		}
+	}
+	return rts_rspec;
+}
+
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec)
 {
 	u16 phyctl1 = 0;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 401fed6939..9f517be0c7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -212,6 +212,13 @@ static inline bool is_cck_rate(u32 ratespec)
 			rate == BRCM_RATE_5M5 || rate == BRCM_RATE_11M);
 }
 
+static inline u16 brcmu_frametype(u32 rspec, u8 mimoframe)
+{
+	if (is_mcs_rate(rspec))
+		return mimoframe;
+	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
+}
+
 static inline bool is_single_stream(u8 mcs)
 {
 	return mcs <= HIGHEST_SINGLE_STREAM_MCS || mcs == 32;
@@ -279,6 +286,9 @@ u16 brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 			     u32 rts_rate, u32 frame_rate,
 			     u8 rts_preamble_type, u8 frame_preamble_type,
 			     uint frame_len, bool ba);
+u32 brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			     u8 ss_opmode, u32 rspec, bool use_rspec,
+			     u16 mimo_ctlchbw);
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec);
 u16 brcmu_calc_lsig_len(u32 ratespec, uint mac_len);
 
-- 
2.53.0

