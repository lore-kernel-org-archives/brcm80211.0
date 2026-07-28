Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8992E5429
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249977; cv=none; b=FnoB7B/qFOXK5SyhlqFbPAxeymvHuincoOGazgsLEY7trfSQoMwABIlH7F51hy1AYNIBpgmIvDLmUPdhMpRKG4lGOxHljm94PYufRkLbNnNXLsZgDfZvXN+r5Sr07Y+kdw+TKNdAfUh8LMLDCHKVFSMVcH3jdKbrx3VEN3Zv6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249977; c=relaxed/simple;
	bh=wIz+3euQACHcMtzoe/1WVQoQpiunxZW+Fc/WKDXM5WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCP0ueLMiRQ8RttK5smtrwUSEqQnUq6a4WTyFOzsdfpTCT71VoQiYa59QLXHc1mslUtBuIk8xhi9jhicIENNl3M7ANxL2LMja+hhv3SOD8BMitJx3ZppgIr9AwtElJqlhmqxN7Dpp3pn8hiy4Q3q9KUAN+0PM6ETw0UXsZUuZog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ffgcjsVA; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ffgcjsVA"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-451a49abd8aso1855946fac.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249975; x=1785854775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=VPb+O17l28LO8PhY856VGdE461ekxh9lKZx1DHCZLj7CkJMrv5zlQph+3Or7mJHMAB
         +0n9CvvryK4I+BDQ4HuPQsLnvfOnc6Eg6ggvLzqXa1NsZ/thv56X4903P0ZzvtHyPkKj
         AoYCkVzq4To6AJ8AH7WDrTbJSjW/9cxobfZwVd1dqhR+tAR/MltY2eu7/NVhuALi5nA5
         UigsHbSpG/c3UAX951CuSk1qlNqkmTS1J8QskHEToDNcvq+FQBdg+rONazA7ylVUtH1B
         pXW9F0Jy+jv6TK6qrqi8L9W3pWOKouYHdFei45AlRb9z3/JhudmTnVQOGanl5gK8IAHu
         Dy4w==
X-Forwarded-Encrypted: i=1; AHgh+RoL290SAc9LkmUwN+q36S+bkLkAGW+r2AemMHEMeKeOp8F/EZXXGvCjx6cHYdvpNcY2BwjKzlbeb0A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc5tq7tRBEHWt1bQsIyQ41fcFF7J01P+GUKRgeSdZrqiwl99/P
	q5OgFZdPcBCeOMyPpswe2QXdZ4kpjIDw1gqqQCCf3VUa3Jd20IOHVGeYk9YeP+dMpx+V6mgbc71
	2gK9gAcXh+2ZaPdNA63J3vgvIF0w/CZ3FTfMBJYn/7oWneyG4LJVbZdcGD4/A72DaAUaQKPOF20
	6kzXBLcvn+IZVtW4FTNrKdsXFU91qCdHoNbm7B8ghN4blcEUtaoZixclfkq/6c3t/NxClKRzOiX
	DE+wwKdHSrtRE2Ku9SRIw==
X-Gm-Gg: AR+sD13NVquSKOeQlM3rYPavNhqb37Oa7Qg6gwTgiEnjrFYAvyhPVNRdRJgr2XAaCbe
	IGdsHZOryNOzeCh0ZZSosGGzM8DSAg6tlyQBKc+II17oh0vMEwfd6MleZLqIB0mgffPPV0P39vN
	yMOVFGmcpA1MTbccfRM1fV9+sBuuQYq0oCNKfE5HQyv87pZwIKA4a3fjA9uRrkiTX8gtldRhVbV
	7zSUMBFSBOPPK2APqrQ+aaBiIddKSkp1ib2zzktJmbYFXRZ/PBsAkcMrwaRbwFXy5CAYc4/Brg8
	Mxh5WidmH87B3q8JO7ymud1JdI3wsp2T3hvDX6dkTjJFQqHvlJyGtCvgufQr8e/U2uzc5BNvaa0
	A8NHKf5vMSLTgW8VWN8WYdGS551mdDcvoNm8oniUaNcpupGgH/2Z7sZ+gwSb2Rhk7hze5PAdVuC
	EgN+N8RVieBYLitmcgJkGO/bag3TkonMvJP625xvw=
X-Received: by 2002:a05:6871:20f:b0:44c:ebe0:f50 with SMTP id 586e51a60fabf-4586ccf4773mr1608572fac.14.1785249974963;
        Tue, 28 Jul 2026 07:46:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4588690bfd6sm4284fac.11.2026.07.28.07.46.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so415707585a.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249973; x=1785854773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=ffgcjsVAY5+eyZEvgIechGro8uWWG5bpFmIn/RpBuFkYN+5nZFjoTvLXe8dBywC5w4
         WDNwnacCms1gWGPZBaAaa7oGBZ2JRRz0emknNdteZZVXNwlOTwbNvSSDVsmxiIbAz+dc
         P1Dtf7NdYpe8hOZ1+oHUxDw2DDYqeOCPpJJag=
X-Forwarded-Encrypted: i=1; AHgh+Roga/6ausL24/MoPVlR4HPavNhUsQPZchud59duQ+avTLgSUheqtdw0S6cV/YOOAxp4h0e8QXCf9m8=@lists.linux.dev
X-Received: by 2002:a05:620a:4622:b0:932:dd83:c54 with SMTP id af79cd13be357-933026926bemr254651285a.42.1785249973117;
        Tue, 28 Jul 2026 07:46:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4622:b0:932:dd83:c54 with SMTP id af79cd13be357-933026926bemr254644485a.42.1785249972438;
        Tue, 28 Jul 2026 07:46:12 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:11 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 08/12] wifi: nxpwifi: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Tue, 28 Jul 2026 16:45:45 +0200
Message-ID: <20260728144549.2207061-9-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop calling nxpwifi_roc_cookie() to generate cookies in
nxpwifi_cfg80211_remain_on_channel() and nxpwifi_cfg80211_mgmt_tx().
Use the pre-assigned cookie from cfg80211 instead.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 4f9e20f72811..198174ac754e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -212,7 +212,6 @@ nxpwifi_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	tx_info->pkt_len = pkt_len;
 
 	nxpwifi_form_mgmt_frame(skb, buf, len);
-	*cookie = nxpwifi_roc_cookie(priv->adapter);
 
 	if (ieee80211_is_action(mgmt->frame_control))
 		skb = nxpwifi_clone_skb_for_tx_status(priv,
@@ -277,7 +276,6 @@ nxpwifi_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = nxpwifi_roc_cookie(adapter);
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
2.54.0

