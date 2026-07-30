Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21745FFD3
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427479; cv=none; b=Za1IhhiMqEmD9D0+tiboHF+K/o6I54DRRUhv9OzGAYyW+YIIj12RIBkV8WlXzkKA4arY45qhFe4InJ4/hwC8p3xEgrD2u3T5jzAUHGUKFNBvAW2+PmOVNA1ZijAuSCMxt3qPNc54i30/gQtYYTFck6DtRY9C4LwrWPxJjY7Hu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427479; c=relaxed/simple;
	bh=83sqCGdGcSCvVa+9JspIJKCFU9FvCzQFy5Q7L48LIJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSrqI8TjkkSwKoQUsy/kE6E4vuuUm25d1+qJz+xaTICvDJjlT5ljzD4oKYWxvcyoaq/foDCK76jOxK78goo1J0CWoK1KSdwBTB/TCHWfgQnhV/TXU0B1IXNJCv7PFjMI41f7/cik8g9E8RCjx9mprXCgTzkDZ4SdT6JaIaUpLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilcLBgTt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilcLBgTt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e4efb18c9so6282b3a.0
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427478; x=1786032278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jIAI+a5zpsh6wBE3laZ7ci5SL/RFgEEpXPR8uss6Ao=;
        b=ilcLBgTtQAWNk+HsIvzmQfA1LxN1T7lt0flN5ttEAc8D4+v/SLg3olSTHgPSgxN2IT
         MFWHzXAaS5ISAiqKf6f4VCpO3C7SsDr5kVLOwyQ+gKZifHUabgjV30chp9Z90MRQlbIt
         T7EktmCVRXjqQtgA9Fnli5j7yb9g3YrhvHaNkrKuX+EAlrzPKcp/wrWASMeFRYZCpD73
         xViu0Q8o6dYE1oiKMPRyJQYAoZ4AL8gnVNR0QLSNicyvT5L3ly5p+kWcjbIZjYmxmchB
         O90HMkFNAOQ56KwgICWcxxHsj/5f6rfkH6zK3iB9ytm13Fel4dcNHAG1bMTASQ0Xxtds
         3HFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427478; x=1786032278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jIAI+a5zpsh6wBE3laZ7ci5SL/RFgEEpXPR8uss6Ao=;
        b=QmIswN7h/WoUGlCSXRGON1+S0zt37yb8SibkXBk5EBA58B7t9VeCYciR+q9/RjOHgG
         qDEpJOIlCjnewFz9lz/11zXv5Z2Qocn8RRkt6ARQUmGArVZ2xaTt7FPahBBYNwnLfc9A
         4e4bkyT1t5Q5+oG54b6kkdoe4bOY3do1y1boJB2D6xM7gOi5sQt74AWP6/LnC+IHxjxD
         8o6mzVNqfTzAtuMy4cKbIMz1JqhRh0Fpo4wfyUB6ZO46MXlbhwlhG3HUeiS/P9S8CxDC
         aMDu8ZGlmtqkHAyFvDOiDwku43GjVwvFW6ZfZUAaTy7oA619hGTZzE4aIrFPQz2kQc3N
         gZDg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7FO15D6W7D/tr/Utf8Ou/RVVcNcnkDpvQTh8ichzuR4+Skq3QZelrJhuph21pifV1IDgDtFb1ZiE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSde8nmALtN0I3CG/9AZzIZAt7CWUHmw0oUwZtbHumApGV8dAN
	Id0LDvU4ITjqThmFj3BBbvjV01dmPN2j2bvpyP3eh1xaIAaPqVStqlgy
X-Gm-Gg: AR+sD10Lv/wy5FSXU9p1TmMKRcSC8UObeXG+sHVeRyHJuqxEK9O99opCIBVrVPUWcmI
	E/DyvfRbuqA0n1rqgIeIts4Ukg7Ac5XW6aUPfYIJsR7v/p+Eq3TXIf7wGUgMfpAl0Hpg2KeYb8W
	NAq4Na+KotJErdpaXY+gHx8K/cU4Sp214HIjnf1t8jcNlWMhBta/jWLgMBOIZDp/nDz2dgg4v7T
	YxvWxauKaQ5ANKeKSFasQ0wRijggxQoGegCDMtJJc2oUAi7Dd7aM3N8GtGqE7wIInQVYnf0CTer
	ciR/XbnReG6fCtA5yYCKja3JrGCZR58e0XSkeT2Ct9+QkBtHiIV7suzwhfME1jrJK2ByMRNDgpU
	aSgQPiQ/cXhWbXe/Jds15/M9E/15hzgvIBLFKH1EVPCu5EfkLeczSFLh5h2LlO/vxbIwOZPLyQe
	WPpARRUhaK2+uUiZTiK5AAA1vyuG+k+9ZKlA/L0Yf397R4+VOBMQlCgvgDwl0IyxTuuZWhmLsPc
	Pk2sEngC7LsaQ==
X-Received: by 2002:a17:90b:1c89:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-38fa80944a8mr870183a91.2.1785427477707;
        Thu, 30 Jul 2026 09:04:37 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:37 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 3/8] wifi: brcmfmac: core: populate radiotap header with RSSI
Date: Thu, 30 Jul 2026 16:03:51 +0000
Message-ID: <20260730160425.11933-3-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populates the radiotap header with dbm_antsignal using the rssi
value extracted from the firmware's hardware RX header, fixing
missing signal data in monitor mode captures.

Signed-off-by: Shivesh <shivesh@example.com>
---
 .../broadcom/brcm80211/brcmfmac/core.c        | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index ec170647800d..673f0000389c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -431,45 +431,51 @@ void brcmf_netif_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 	netif_rx(skb);
 }
 
+struct brcmf_radiotap_info {
+	struct ieee80211_radiotap_header hdr;
+	s8 dbm_antsignal;
+} __packed;
+
 void brcmf_netif_mon_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MONITOR_FMT_RADIOTAP)) {
-		/* Do nothing */
+		/* Firmware already provided a full radiotap header; do nothing */
 	} else if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MONITOR_FMT_HW_RX_HDR)) {
 		struct wlc_d11rxhdr *wlc_rxhdr = (struct wlc_d11rxhdr *)skb->data;
-		struct ieee80211_radiotap_header *radiotap;
+		struct brcmf_radiotap_info *rtap;
 		unsigned int offset;
 		u16 RxStatus1;
+		s8 rssi;
 
 		RxStatus1 = le16_to_cpu(wlc_rxhdr->rxhdr.RxStatus1);
+		rssi = wlc_rxhdr->rssi;
 
 		offset = sizeof(struct wlc_d11rxhdr);
-		/* MAC inserts 2 pad bytes for a4 headers or QoS or A-MSDU
-		 * subframes
-		 */
+		/* MAC inserts 2 pad bytes for a4 headers or QoS or A-MSDU subframes */
 		if (RxStatus1 & RXS_PBPRES)
 			offset += 2;
 		offset += D11_PHY_HDR_LEN;
 
 		skb_pull(skb, offset);
 
-		/* TODO: use RX header to fill some radiotap data */
-		radiotap = skb_push(skb, sizeof(*radiotap));
-		memset(radiotap, 0, sizeof(*radiotap));
-		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
+		/* Insert our radiotap header with RSSI data */
+		rtap = skb_push(skb, sizeof(*rtap));
+		memset(rtap, 0, sizeof(*rtap));
+		rtap->hdr.it_len = cpu_to_le16(sizeof(*rtap));
+		rtap->hdr.it_present = cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		rtap->dbm_antsignal = rssi;
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	} else {
 		struct ieee80211_radiotap_header *radiotap;
 
-		/* TODO: use RX status to fill some radiotap data */
 		radiotap = skb_push(skb, sizeof(*radiotap));
 		memset(radiotap, 0, sizeof(*radiotap));
 		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	}
 
 	skb->dev = ifp->ndev;
-- 
2.53.0

