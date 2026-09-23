Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2293F6C24
	for <brcm80211@lists.linux.dev>; Wed, 23 Sep 2026 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195629; cv=none; b=DdhGUKXUl95nDYH1yLnxH2EGdMVJu34lP8206TKwd9YC6+RXWe9mZgGDTFKcBdZYfwiXfQpNTTOMfI1AiQbr7I5V4LUUxz971L91lszzxWrzrOl763fScgIh1kpl1pTd5pqpKkJ4Xv5scHqVjQKaYqwEC8K4kWI4fMrTex8oVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195629; c=relaxed/simple;
	bh=/JJF6ssyxAQdmL0bSTx1Ono3iYU/qejhw/WQLlUJjoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIfaAyBw/fWq5GUGKTIOi9TmXCnawDUj7Lqx5aJ6s2UbyYCVMoHX9UOkCSKI6su3Za4NPElqLb03ojKYrTmlOfo/M4RpudCU/vhLlMLFpnHu69/R+13ZtA/l7dDAJCOmrgdHG0W+zHx0W1vl/npxCtks2hUzpywehINED5CW8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=posteo.de; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7B031240103
	for <brcm80211@lists.linux.dev>; Wed, 23 Sep 2026 22:33:38 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqpZn2flvz6twP;
	Wed, 23 Sep 2026 22:33:37 +0200 (CEST)
From: Benjamin Drung <benjamin.drung@canonical.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	Benjamin Drung <benjamin.drung@canonical.com>
Subject: [PATCH 0/2] brcmfmac: firmware: Add missing clm_blob firmware files
Date: Wed, 23 Sep 2026 20:33:38 +0000
Message-ID: <20260923203253.2553179-1-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I noticed that these firmware files were missing inside the initrd when
including the brcmfmac kernel module:

```
/usr/lib/firmware/brcm/brcmfmac43436-sdio.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43436-sdio.raspberrypi,model-zero-2-w.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,500.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,4-compute-module.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.raspberrypi,400.clm_blob.zst
```

These changes should be backported to the stable kernel releases as
well.

Benjamin Drung (2):
  wifi: brcmfmac: Add per-board clm_blob firmware binaries
  wifi: brcmfmac: Add clm_blob firmware for brcmfmac43456-sdio

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.53.0

