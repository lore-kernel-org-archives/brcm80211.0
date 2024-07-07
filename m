Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705E01BF37
	for <brcm80211@lists.linux.dev>; Sun,  7 Jul 2024 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720352833; cv=none; b=Fk19fNRcNWzVd41ZR0uT/Uk1erat6bPrzkepKAwXdIQ6ns84xssnj7/UBebdX7xmvxEwIQ1ZNvrrjMUyIrBXfQdF+tAGtkTrda9z09muc717QkT2lPMoCjMtjzIgLTrdtVRmOtiiqjoyxig9bpkUaMIDM9RnE2HYPy9K5vQc5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720352833; c=relaxed/simple;
	bh=hlpr77o0KjX2X+mZ1mt5vhbcM/4B3GhEtV0sv7HsF0Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IhGRVSmEiXn5c7UwVJyfwlhoZjSOwPfLUJDs39I1jHc1tiORP2BJIysPRhGSNP6DLWNzIS2FvFRWIoS3MXepbzOUY724Hc/v5msj/ViVlTdm+1oVT12kMZqXc1XKGaz1a3ub1uHCyu0JIqUwv5HKVWVBA2I8cghzMTn8WQJv/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIGC54H4; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIGC54H4"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e036d1ce4f7so2017055276.0
        for <brcm80211@lists.linux.dev>; Sun, 07 Jul 2024 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720352831; x=1720957631; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h1LHw2vyC1RS8RVkN1Ue3pUuAeMTdCT4rBbWggPI8os=;
        b=lIGC54H4CrH3O4xLetg+PvxalB+3b6EJ+vU8WHgtn+B3rAVfiShv+2IwVeOaicjkw9
         UZ5Wgbp8lXlG8r7ojwoLejuRVYMCeVa9zDMFjjfycVhWUF5EhsvrGtxm7yjBUB5fSGxN
         BkNij/UajIvHBGuEfq6LtlDjL3p2ZVx+nXcoCTAP3ZURDDG0F+fuSm3Is8BNGiv1Ea9C
         wBGlSnwhhnivKJk+N2rS01qkQHbHlLt2MpPSdTouXxGetRvFIN+IpOfA3ueCK6tmQnrm
         /WOBuCO7QPx8Ap3/JYf1s2dtguKXydg62KV4kkpVW9RqcY8U4fWJDfUT4NXe7LRPNY9P
         viUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720352831; x=1720957631;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1LHw2vyC1RS8RVkN1Ue3pUuAeMTdCT4rBbWggPI8os=;
        b=sa5rIY/bl3DcVND9ED2OIta/lCwoUqfFjl7lDFuzQP51YEcQQRtiBaOClhlUka8Wo9
         kxBsKF1KBjgp2wCg2YDus7hqLveGRtcdD0rWujX6zp5AAlQtVhQsU5zO2qlFynl1WxbZ
         rJuVYmPMJ2TMpQwCZ/bBISM9ug018XH4LkQ1ublxKiD17c6Bbojspvg8k7bTRHTHf/qc
         lFXv22+lwajrmNdVz4knqYuxGb0xtK9Ui7/mYmjIauGbYZCVaXIhnpnm+SFPtq/YzwS3
         Focmnn2yHlt3UwMZkh37Zvzxx725sXxsVXlto0jchQdmF7Hb7cF3ph7+UxpIOFOl6doV
         qUXw==
X-Forwarded-Encrypted: i=1; AJvYcCW5CMDW463was0kaqM/wgi8h/dJCvIEwGyBhawOxrL7OrhjS5bMBERZ4IVXRXM/3ju8bbJYkKVBzHl/fXjC+V0QAk/i8cD1dRtD
X-Gm-Message-State: AOJu0Yyt70kvbYwxx/Y2AEajlKfjtYjVnNkyTyu2v3xLfPvWYPvS5swK
	dwcEzuFp89522wUKs1UrA9Ai02SZWtYbzB9HZItxZetExA30KZDx74E5g08OZV3gGgsujuAQUrh
	+OgJbG1f4gx8ef3ZjEFuBPGEfTE4=
X-Google-Smtp-Source: AGHT+IFpS0yM4FWB9OEjl7SUs183pbEm2fPT5sIvBGn0rEHnEe1xanS3FQHEadCVs6Vi/QhOn/hIqcInBA96cEId05M=
X-Received: by 2002:a5b:8c9:0:b0:e03:a40c:ea0d with SMTP id
 3f1490d57ef6-e03c29ecc95mr5861049276.16.1720352831432; Sun, 07 Jul 2024
 04:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nikolay Nikolov <dobrev666@gmail.com>
Date: Sun, 7 Jul 2024 13:47:01 +0200
Message-ID: <CAHP5HDNpCywoyJA5pCzo1t_eS7FurYqa1Hr6Ac8fGgzfWZyKMg@mail.gmail.com>
Subject: [PATCH 1/1] wifi: brcm80211: brcmfmac: Prevent sdio bus going to
 sleep while transfering data
To: linux-wireless@vger.kernel.org, nikolay.nikolov@bench.com, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	arend.vanspriel@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Use mutex to prevent sdio bus to be put to sleep by the sdio_bus_watchdog
while sdio dataworker handles sdio_dpc data transfers.

Signed-off-by: Nikolay Nikolov <nikolay.nikolov@bench.com>

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 6b38d9de71af..26d0bce6cedc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -524,6 +524,7 @@ struct brcmf_sdio {
  bool txglom; /* host tx glomming enable flag */
  u16 head_align; /* buffer pointer alignment */
  u16 sgentry_align; /* scatter-gather buffer alignment */
+ struct mutex dpc_mutex;
 };

 /* clkstate */
@@ -3724,6 +3725,7 @@ static void brcmf_sdio_bus_watchdog(struct
brcmf_sdio *bus)
  }
 #endif /* DEBUG */

+ mutex_lock(&bus->dpc_mutex);
  /* On idle timeout clear activity flag and/or turn off clock */
  if (!bus->dpc_triggered) {
  rmb();
@@ -3748,6 +3750,7 @@ static void brcmf_sdio_bus_watchdog(struct
brcmf_sdio *bus)
  } else {
  bus->idlecount = 0;
  }
+ mutex_unlock(&bus->dpc_mutex);
 }

 static void brcmf_sdio_dataworker(struct work_struct *work)
@@ -3755,6 +3758,7 @@ static void brcmf_sdio_dataworker(struct
work_struct *work)
  struct brcmf_sdio *bus = container_of(work, struct brcmf_sdio,
       datawork);

+ mutex_lock(&bus->dpc_mutex);
  bus->dpc_running = true;
  wmb();
  while (READ_ONCE(bus->dpc_triggered)) {
@@ -3763,6 +3767,7 @@ static void brcmf_sdio_dataworker(struct
work_struct *work)
  bus->idlecount = 0;
  }
  bus->dpc_running = false;
+ mutex_unlock(&bus->dpc_mutex);
  if (brcmf_sdiod_freezing(bus->sdiodev)) {
  brcmf_sdiod_change_state(bus->sdiodev, BRCMF_SDIOD_DOWN);
  brcmf_sdiod_try_freeze(bus->sdiodev);
@@ -4525,6 +4530,7 @@ struct brcmf_sdio *brcmf_sdio_probe(struct
brcmf_sdio_dev *sdiodev)

  /* SR state */
  bus->sr_enabled = false;
+ mutex_init(&bus->dpc_mutex);

  brcmf_dbg(INFO, "completed!!\n");
