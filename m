Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986144606C
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512964; cv=none; b=YaXg9Jx0a1EUKxvEp8hLre0ZlD3r7xp1vIO9X4WeGpnJA5iFilKOWxGkrYPqkIfD5jarVOhK4RdLCnH4WSQzARNquxStcqyMctFzbDMRCijBRI8WrH21y2AZoho4203j/68bI6v9NECITLMne+gFBT8NFqMhyC0PeCa35VlzDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512964; c=relaxed/simple;
	bh=dwU1WTkn+14qiJyoN/fcILNJIPDNMbgqt2pyeUSZuEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBswRKi3c/oz5C5rfJGr5LLE9ceYCq9lCEH8MJ7TRAxGgA9qDBWl+1wqu+cpAVWKU7hrTu8lYcTmHpFSJpl4xE3Dqnc7qpIQ6lBCC6zva+fBSWgawLMZwSQ91fvJBISATpzhIFPfQNqslMWgPvr/eXSnoZ/4BfSUAlUZ64SI5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYjzik90; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYjzik90"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf420670bbso1111025ad.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512960; x=1786117760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahxcHCC15uBTh1B3etEh/3ZgFZZQjRbxcgGWND2qogs=;
        b=qYjzik90wMu7fZi+Cjg6v89UwdiN826TJVraSiMTbRFRCj8WGG+0393sm2sZfoccQD
         UU5bBmydaZACR2liNM4SBeEASyuWMTvMCVzx5JLrnAL9ZHP1rffO3jL1+3QG9cntQBvY
         QAXu6CJxerTojxG1FLUyco+UYV8B3UC9Kj51minj7H76jYsI8YWo19tBDEqwEis+U778
         Td4vW/Dzhbub5tXAe+y6k61Zb3yCF27PWzVqVt6F99Wcprm68Mn5rzk+rVSW4LldAXUU
         IftVtZtfiN0XHHd8fmgM95/uHDwKu5x811K2OrfuC2SOFFcGgs6ySgod2PaE/V6USWle
         3GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512960; x=1786117760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahxcHCC15uBTh1B3etEh/3ZgFZZQjRbxcgGWND2qogs=;
        b=YHgLCdpbwTIFfDN/TpxRKmXLCm7V9kGyKnOpaXI1rQwQI5ZVloYeVISBVFvgptvGYW
         iFClXnkP5NoC8cvKUCkw54tBo+bMHDcHjDikJdNvpw2Jg0JSMKfnra88LudmmhrmtMOL
         AAqJbSeLpvRHJ71b14EdtEZnKO7fsg/rt6tZUHdORVLoOiiAQ/iWP+f6GLYIzmnvpCoM
         Pg9qYOXXOf67pYHQup7/1mm/8tbt1w+o2urU06zqo418oQObUHEgmcSzMReriWRl3CSr
         hRCW58FO9Eex1TRhFi5YJLv4D+UL6FSvsO75UXYCLHweETxtjBJIOBXASHo5N1zd0Ntb
         NFTg==
X-Forwarded-Encrypted: i=1; AHgh+RqfrIHOswwgSpDauy6lV/xmUruJCcSv3YykYNyeu3PtcbHsD26adViRZ9fO9En7L16js6Mco82Q+cg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzprMtZ3FuZu47h7ommXFzMmywmBi8SfS6LX6X58j0CogADk5mV
	rvkNmS4jU+RzBMogoqpZ4lPxo9+WDskH8TPTUZ7esLCdITiTZq6gr3ys
X-Gm-Gg: AR+sD10hMk9enw0OC5IzjzbDEmV3p1Qn/oz2REIF2AOXfSUbaWcxzIYdVLPLtQUtK+1
	4Ft4u9i3/jKCH0iILvU41VAz7gB0YOf2SyRqbLWhcFgLRvFrFFYczfv+PD7d5zmb06Ue664wucq
	jjFrahct0WwCvtddtGNtzsGFjq3YgCRv+kQpPVpU87MnMo96aZBRivkSRXW/YynIplHH1R2M7gu
	O/TQMhf6LudecDvodQPgwDQWORSVxQKmD5Wwgj2eu1UKwviGJtlCzmkQDiZvvgEbxBcGmLScrZu
	vxDdI2cuXl3c+jJEuHEPl7p9hoJ4yRRffV6cwYTeIVwE8PLikt+SDkNZLejIor8R9f9fLA2EhMa
	5hzdGMQl7RNgyPUdCACoqwWQGVok2Z/CLJs1McQh8Oo8qqPqlT78KTU+Kafyw2ynXYOEoTQ5tgJ
	dZyl1ZVrdQtlkJZF5A1A+RbBvsVyTx3yWYz1fvVOqSJHFaVl/+yQBMehfxYD/mKmLYdRJ5/2dK2
	ss=
X-Received: by 2002:a17:903:38c7:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d052438c91mr6467215ad.3.1785512959580;
        Fri, 31 Jul 2026 08:49:19 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:19 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 3/8] wifi: brcmfmac: core: populate radiotap header with RSSI
Date: Fri, 31 Jul 2026 15:48:35 +0000
Message-ID: <20260731154901.1822-4-shivesh@example.com>
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

Populates the radiotap header with dbm_antsignal using the rssi
value extracted from the firmware's hardware RX header, fixing
missing signal data in monitor mode captures.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.c        | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index ec170647800d..eefc437dd055 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -431,45 +431,55 @@ void brcmf_netif_rx(struct brcmf_if *ifp, struct sk_buff *skb)
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
-
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Insert our radiotap header with RSSI data */
+		if (skb_cow_head(skb, sizeof(*rtap)))
+			goto drop;
+		rtap = skb_push(skb, sizeof(*rtap));
+		memset(rtap, 0, sizeof(*rtap));
+		rtap->hdr.it_len = cpu_to_le16(sizeof(*rtap));
+		rtap->hdr.it_present = cpu_to_le32(1 << IEEE80211_RADIOTAP_DBM_ANTSIGNAL);
+		rtap->dbm_antsignal = rssi;
+
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	} else {
 		struct ieee80211_radiotap_header *radiotap;
 
-		/* TODO: use RX status to fill some radiotap data */
+		if (skb_cow_head(skb, sizeof(*radiotap)))
+			goto drop;
 		radiotap = skb_push(skb, sizeof(*radiotap));
 		memset(radiotap, 0, sizeof(*radiotap));
 		radiotap->it_len = cpu_to_le16(sizeof(*radiotap));
 
-		/* TODO: 4 bytes with receive status? */
-		skb->len -= 4;
+		/* Strip the 4-byte receive status / FCS tail */
+		skb_trim(skb, skb->len - 4);
 	}
 
 	skb->dev = ifp->ndev;
@@ -478,6 +488,10 @@ void brcmf_netif_mon_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 	skb->protocol = htons(ETH_P_802_2);
 
 	brcmf_netif_rx(ifp, skb);
+	return;
+
+drop:
+	brcmu_pkt_buf_free_skb(skb);
 }
 
 static int brcmf_rx_hdrpull(struct brcmf_pub *drvr, struct sk_buff *skb,
-- 
2.53.0

