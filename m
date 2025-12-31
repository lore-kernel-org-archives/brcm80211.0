Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035327465C
	for <brcm80211@lists.linux.dev>; Wed, 31 Dec 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191769; cv=none; b=ffcsPAc/8VBhJ/kwQT+LOdS+uKoq01s6FVBQIT+VQ3U2OcoAVLxm/ePRqUekk9UMYog4/QmI5XeailysKnRxKpENH0eA2Lz6u/7HvXxZta8iCaJWMXV0K1VmznvT1i8fzrmpdeZWO9huodLld8XSIANVaq/If3G2G484Xmp9nx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191769; c=relaxed/simple;
	bh=vsiST/07rYhbTQzqCgZs5FnzSiOmKvIXyGu1X31veBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=MZTQElhIgMaxSM/nBWdGfWvo9QFrMgvCg/Y9wVg3yVGm0JBedeb/q+6zEXNfZycDgQzp4QG+OjafQlaraTbC4Xp9cSIFPlkxtcvcKOwPZuVLlSv9hXcgKG8eONJZY649qIf7xpowhiJHrSInuvh/MHeFFw+ufLimxxCYAaTvV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JWrCStDh; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JWrCStDh"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251231143557euoutp022d82d84f1f57c61dcd963b8cee1aca73~GU4pBppqb2804228042euoutp02p
	for <brcm80211@lists.linux.dev>; Wed, 31 Dec 2025 14:35:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251231143557euoutp022d82d84f1f57c61dcd963b8cee1aca73~GU4pBppqb2804228042euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767191757;
	bh=8N9YO7QntK0cccpN+TuymZR/O57Nom92ayVWXauKH/s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=JWrCStDhMmAt4Lqf9vA01tHfEvecBepJMalKW6cwfA4GvIaIvRIu9nkERiX3/hKBB
	 sQ1j5pFKaR8N5Um7mhfyoX28ohpDxdgJnCG0Ae1SO2f2J6y99vxW5EGXGfloVts36F
	 nE5W11iryRwQbhRQEZel0IXoaG40c4QOnI+/kAsY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251231143556eucas1p141b278048039730d03edf85c6f3e5350~GU4oMYIqo3236232362eucas1p1-;
	Wed, 31 Dec 2025 14:35:56 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251231143555eusmtip2dbe42427d02f0882fd6f67bd5bca1a81~GU4n6DgZ01784117841eusmtip2T;
	Wed, 31 Dec 2025 14:35:55 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arend van Spriel
	<arend.vanspriel@broadcom.com>
Subject: [PATCH] wifi: brcmfmac: Fix potential kernel oops when probe fails
Date: Wed, 31 Dec 2025 15:35:44 +0100
Message-Id: <20251231143544.4158840-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251231143556eucas1p141b278048039730d03edf85c6f3e5350
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251231143556eucas1p141b278048039730d03edf85c6f3e5350
X-EPHeader: CA
X-CMS-RootMailID: 20251231143556eucas1p141b278048039730d03edf85c6f3e5350
References: <CGME20251231143556eucas1p141b278048039730d03edf85c6f3e5350@eucas1p1.samsung.com>

When probe of the sdio brcmfmac device fails for some reasons (i.e.
missing firmware), the sdiodev->bus is set to error instead of NULL, thus
the cleanup later in brcmf_sdio_remove() tries to free resources via
invalid bus pointer. Fix this.

Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 6a3f187320fc..6615748fa5bb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -954,6 +954,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev *sdiodev)
 	sdiodev->bus = brcmf_sdio_probe(sdiodev);
 	if (IS_ERR(sdiodev->bus)) {
 		ret = PTR_ERR(sdiodev->bus);
+		sdiodev->bus = NULL;
 		goto out;
 	}
 	brcmf_sdiod_host_fixup(sdiodev->func2->card->host);
-- 
2.34.1

