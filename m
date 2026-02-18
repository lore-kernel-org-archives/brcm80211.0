Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D8293B75
	for <brcm80211@lists.linux.dev>; Wed, 18 Feb 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771420529; cv=none; b=OOheiALpHdYWOAUc2AhI+Vb4ZHb9uwoonl1fSL3OeEYEtN2BK7xQwEAjB4rxxyXM0Pn942wMxirlWYDSMRayiGCJ8TFpm7RrddI0yzS6a7YZSMaMhT0m3qYl6Klii5yzWjhgmM46xWSnVrmgzf0tvHl8S+5bPCVY734uf7FuUUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771420529; c=relaxed/simple;
	bh=qgqQM3BicoLp//iJlSD25LJvavgVBcGFV4txdNSMKCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhiqCOD6aFw+IlbRqe8S/nSXc2NdAxScCkEIkSnVQ1LhY10iR4C0xAQdjS2mua/mVxAHQCnPfrlUwOoW93YEYxDigQ8Ed8UfwUT9x71blTfe385/2nBDgGvaK+QtsPxdSxcczCWbZIHhONLIEHFHcwEpjZkOfoHP+bFeS9AoPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSmNe4mC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSmNe4mC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837bed3d10so5780665e9.1
        for <brcm80211@lists.linux.dev>; Wed, 18 Feb 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771420527; x=1772025327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTS3P2DdO9rrBOyQJCIkcrjqmQuomaNDxfVohLWWfaM=;
        b=PSmNe4mCa1u7TdcUuos3WWoXtWQrZMHI1QZKwDCIUzss9suMBP29sqvYyvkucUQ8WQ
         BkAcR5wD76FidBh2vmyyzfpLc6UhsVq099dMYShnRUcr7x2YcIzshe4XlhH91DBh3/U7
         3i4KPX/WiAo9hO0c8XDTTmmn0axanz+0lvgbXgFY86sAfK81/rCTYq7FaWyvHPQVkgQG
         dqPeZe5+AHDaXdSpAcbNAbaiGyLdZO/wt/IV830VhpoFxLoaAYNuBjp980MH2sxmPQCc
         xMEquuykntQgrKU9o48dJa7+DTgN6sPq4VtNI0cw1sgXq12nX8AmF6QrSUpqm44M5iaR
         uTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771420527; x=1772025327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTS3P2DdO9rrBOyQJCIkcrjqmQuomaNDxfVohLWWfaM=;
        b=N0Zdq8Tj7R+A9EHFlih8qdD6qBwrfcdYGkrAqodMeKYOi7PXnoSB+tHpVm/MouiXH9
         gH7yWBqPsy+ynraUSi7RBrITQhAdFFHuNuRUVRWp3DPDdS95lFyNTkBPM0CbOOjrgtTq
         0FUjdGm3jgdTnBYUju592e+kproA3dgGWROnr3kkiICzk1ZIJWN4wlBOp5syrZsq33yz
         0bsB06ZznNzbwyw3x0oEQuW8LUCIhBZvuzFpdySRNDeiprGwM9P5C2u+pIvHaDa/kZWq
         veC6ACkZaHJd20cnu9ggltcbqZ583QYlOA/dPsoRgP5IUprOtdtAwdCpgYVMDcDMkiBK
         Mq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVX8QmGtxkeJPkU9poPMQqdkTxLh6hfk9f8gZAxLYF3+Qk32PD0UP5DW5E0kXziVQx1+12SSWwozZk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzxTcouD160NTGP+8/wGyBlxFaqEkgQRzMiii4jtXGPfTwktBS
	DzZ54fFxgb2/y1JotdgoUAhIA6YlWauCkkcyCJrPoVMQbYi1UhaMbCoo
X-Gm-Gg: AZuq6aJL3EkGN+kU8oDMrJpfO2a5vmE4wv/65SjAm2lrjUEiybvgUF1c6lJXdEDwYyg
	6VUuyCDFGOnhUueyxaH7ZE+bBzCm2PvWd2uWLJyOz9WeGfs5twS/eRNlX9mHMjVX98772V030/y
	mE7YeYZzXS8II3Ixrq1HBgCwIvOD9QC+acrls+fqmvIgzwBQh594EE2J1hOavxQHI45fFArpzy0
	3ueVC6snJ1IlEjb+B+TKWdgyziizruwZpl35y7X8dzeNSStkOskUImIfDwgSWvTIkE+nIJiJTpf
	YJbA8Dv9iJ3l2xrvTxwl7n45ko/RV/B3jxzZewR3xJT04mG7ucaxWHxHYg65J4L9byhF4ZnjzNQ
	9D4ZFYLdKZyBqVznZULknX6rdBQC++VTYNUcYGw0Ok5HwAe3MAR0FetxE6IXs4ACaBLIUWvbJW+
	GoTS5QXPFTNzRNDukdFqfh8XIq2er3dy3SDwp5zHXOfF+HOE3En8ozYfP96AslE+29NcX8KeFsg
	zpPZbQfFie9KT77qlusVG7FboJoADw=
X-Received: by 2002:a05:600c:6912:b0:477:aed0:f402 with SMTP id 5b1f17b1804b1-48371067b29mr185755875e9.8.1771420526501;
        Wed, 18 Feb 2026 05:15:26 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-82-204.paris.inria.fr. [128.93.82.204])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm38768246f8f.37.2026.02.18.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:15:26 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Simon Horman <horms@kernel.org>,
	"John W. Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] wifi: brcmsmac: Fix dma_free_coherent() size
Date: Wed, 18 Feb 2026 14:07:37 +0100
Message-ID: <20260218130741.46566-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_alloc_consistent() may change the size to align it. The new size is
saved in alloced.

Change the free size to match the allocation size.

Fixes: 5b435de0d786 ("net: wireless: add brcm80211 drivers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index c739bf7463b3..13d0d6b68238 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -483,7 +483,7 @@ static void *dma_ringalloc(struct dma_info *di, u32 boundary, uint size,
 	if (((desc_strtaddr + size - 1) & boundary) != (desc_strtaddr
 							& boundary)) {
 		*alignbits = dma_align_sizetobits(size);
-		dma_free_coherent(di->dmadev, size, va, *descpa);
+		dma_free_coherent(di->dmadev, *alloced, va, *descpa);
 		va = dma_alloc_consistent(di, size, *alignbits,
 			alloced, descpa);
 	}
-- 
2.43.0

