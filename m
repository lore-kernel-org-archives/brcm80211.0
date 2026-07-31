Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C71416D1A
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501341; cv=none; b=BGAe6gBLpT8A6o/CVgBgOZoOWwqqGdyhIN9fw14VnWbdbEzDo7SezS3i7WaARNglrfn3Llm0MqOahyuxPsw7mMIf1q1g0T8GkZbo/PmAheDS+22q1Cde8mKz9nUkmAd23G1gzQ7GWjkga9+tl1R6HypAX4z6Y2NTjBAqTaCYtC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501341; c=relaxed/simple;
	bh=YN70RHjCwmQ83vx3SX+04RYNQVnGpUEZQcVazfzYY2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqynWDThjBmvJXYrvM3ZHEw356sFoFe/eWA95dC0wdDbYBnDfiqRFUha+Ato4zzSFgigNQxPXx+oErGGwbPsxqdea9iYiPIyWw5zw2z2hnvAAfaUy3z/yt/cVrKrUgMmD+Q6+9Q3+mdM7xRmy4tOL8oexDCxt5fWF97DNDkwo/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UeBBmzkJ; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UeBBmzkJ"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso322562e0c.0
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501338; x=1786106138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=YG9Dm24HgUFKK2HyuojpVrJlM8gM9G2JelAFUgEx9Bh0l571whw7tvSJAgR8VbCaWe
         7HjUuOt4tbk5PplZk9qdUPR4wXfeBy9QvpGzIonubi6sls4nIKpxYzvhP1A5+1uoUIZY
         OrEk3s9uYebu2QBn4hMHEvrXwBuhSDM0KvA3vgHgnfMvarva1snCqI0u73YTaj+In/9f
         6S30kaisfqCAGN9GOozs+kDgAqF0VWCNE96Cu57sxhhnYPzuyRStROwHpWtzZKkyxEhZ
         sqYSasfaZAY1V000Ibkll2/KPH9mmt4OXuueec3t9T4z7oxztBLN+YM1ofFbv5ycXXP6
         C6Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rp6BHLz5/KHYJ2d+RWReK6vG6YduEtwi0x6yR02EyROH4rM4Ct2HJU8GAPrHpMEY9U+gmK2CSNrKFU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxstMTP2VdC1nDdBB81HroPN+RIw9iFu71lEhhMkI1flRHaKeD
	0WC+KLkmMVBFaBq6YeOy56ZUVIHQN3Ahx4A3HJMLEgFUSY7eA0TdN1fGMwqz2VtjiSCCD6PT4EO
	x73WvwHN/+gBpRsWwba4leZPSH99bZE0m+v/Duk1CtL9uI8dPAOqIYnzMfDtiLU5KjzsglWpcZd
	rsBVxLD/bbeO1zllc2mnQJg57s79qF/TWPP6nQ/xGS7zqVZk9Vumk6505MAxtV5kwFiz9a0NAUs
	c4nRsv3SCFp3nvIIX7bUA==
X-Gm-Gg: AR+sD113donsS31r4U5BbWnc3GpO51sg3SD3rNGyfIKqDCBWvY9tVOS/xTynnKJU/EO
	9waY4BxqznzukFv0sw/LiDrLp5C4m4TVljhPy83Pd9qzSyLbTKSBGwbAiSBq/IejUrthBN25ntS
	+MGEmNFW2DgEhaNSnncE140POISosks3YLUhqM7zjfCJsRQ4C+1Q+rTZ1YPK9CmD+5gDHSq7ySY
	cMtAFjwCQrczmSRGh3MVC14my0YnI89hQi5yroalJGeM2B18eX+94a4BaDzjljyGbfj/xvo/9zR
	jDhs2xIkzpGA8BmNtQP9G99oVpvAs9d6adZ1SQAH/B757x79+WtjCeQZPgHUC5mE7jvRGFCgd82
	9h5i+wj/R3uJDfanm0SKMKoB8JqH/4jwueab6J1cdoVEtVTfAFDwVe+jVXUaoKQwyMLal2aJDyt
	p4zo+NoBbPtrNR1aF6fpJwfGg4f0UI1HOtwAzRn1Y=
X-Received: by 2002:a05:6122:32d5:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c37e874209mr319608e0c.12.1785501338303;
        Fri, 31 Jul 2026 05:35:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-977e66267b5sm69107241.4.2026.07.31.05.35.38
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1589870a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501337; x=1786106137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=UeBBmzkJeFac+wp8dsIyytVXHglzfWmkFqTqwN1HXsbsMsKodzRxnF+LS5WDtBORKX
         DR2if1MoWwxwyiH8EyMq5qb3JIEjj8B+uREvLWa6+7SXceTyLQ4wMDZ7pDyPETOM+eId
         lqORTSraNV3NgexF5i5L+q3pDEsz+vCAB1vHQ=
X-Forwarded-Encrypted: i=1; AHgh+Rru4d3buvffELWLh9nAY3bcp8sVv162tuhq6foURW2Eu7UYXBNjQhtxHXrBckgYf1hdCe2VCd5rFgc=@lists.linux.dev
X-Received: by 2002:a17:90b:2b4c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-38fb10f0faamr1832843a91.4.1785501337076;
        Fri, 31 Jul 2026 05:35:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-38fb10f0faamr1832830a91.4.1785501336596;
        Fri, 31 Jul 2026 05:35:36 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:35 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 09/13] wifi: qtnfmac: use pre-assigned cookie for mgmt_tx
Date: Fri, 31 Jul 2026 14:35:05 +0200
Message-ID: <20260731123509.1975281-10-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop overwriting *cookie with a random value in qtnf_mgmt_tx(). The
internal firmware frame identifier (short_cookie) is unchanged.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 9e44c85d2051..284bc61c46d0 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -454,8 +454,6 @@ qtnf_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	u16 flags = 0;
 	u16 freq;
 
-	*cookie = short_cookie;
-
 	if (params->offchan)
 		flags |= QLINK_FRAME_TX_FLAG_OFFCHAN;
 
-- 
2.54.0

