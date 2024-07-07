Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E031C694
	for <brcm80211@lists.linux.dev>; Sun,  7 Jul 2024 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720354971; cv=none; b=Qx3ZAiLvufxxN68uWwj4e2AXys/VvrWuVWv4eqHZlvcVOCQhoaCpSR7zZ93rw1HI4mwTZ69dxNrsrxeN+QnKVcDNVefWkiNo31HiM9XCmnjd1mvKO4yzqXq7o5fXwFTmhRvZjDZC8dIfcxuHJPEHlWXMXN0a2IK5NXf89nBhTt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720354971; c=relaxed/simple;
	bh=+CXFIVfFvvwW4GvASmxmUlnYwcL+GLAgC+SyDaqFxw0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fe3YKwOlx1ureSx+INa0evmMqJxwA1Vyp6Wzj2VeZGgB9+zHAagNZBHvZbcCTqKnt8X9WhiMfXBQzzMNXz0aKQ+VTWj3opxNRe7FVmmQvHVBvoLzbjLqtK4qzABIiJQaSa9ZCOMMweJfmlhzR0y+KZ3ezuY4fbPPTdS012y4Lq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1pMmGYY; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1pMmGYY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58ba3e37feeso4144092a12.3
        for <brcm80211@lists.linux.dev>; Sun, 07 Jul 2024 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720354969; x=1720959769; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9sc60lciZAXb7QzPxcfPWmmHEtScDELqGwwdUh19ys=;
        b=c1pMmGYYSg41TedJDk6IXERYYNfgxNuKVONNYEDPCIpIti0YQvP3YfBMwof033sFzU
         5cF/A4OmK8qvKZxTnUwI/oo6syf3S3Uk73peKkEaZgE7m+lqELqWUGBnro9O3OrHLBDY
         fl488a5I0hk/IDVUooVk10lxfhmcI6uiOrHX1KCtr/Jamwlmkh2FQB1AfXX7TdknnXw5
         fchW0umr+p+PIs2qGGOGCuu83gt8lgXZ74zNjeBcXJyV7EQ5tuIxY1Qqy3nYqU2xHRkk
         4Z6nglMNiG5GqY7orVTiFDOAqPWN4ej34fZofSkzgd7cquNalU1VBBZHIfsBMdDTUxqH
         AuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720354969; x=1720959769;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9sc60lciZAXb7QzPxcfPWmmHEtScDELqGwwdUh19ys=;
        b=qt6BYXrzQPr0DRSFhqhh9xJm5Irq5Ha7lPjEY97f4+3i3B1cQoHniHBLshRg3DNmH2
         5le3cqj1DrqewkqjxZ5p2HhiHRaymJ025tfXtFqcXoisKMg5ep88mPsv0+Rbe8HiX2VQ
         n7QOeIfKRhlh2gAIQEENHd9NExJ0RfdV45Xr3+Oe4GTi+VPZCVQj0Lv1Ua7mgHoV/nj7
         Ivb6NzaQhLuPX5vBqa6yq/2Zv48+xBIRviYCuRRK78QL39B6mYaDQDLWsoT5ux3noBfb
         72Aj8nY5E+AD1NElGou8f5CuuKgQ9v6HHHN5dU44Ann9fgpd1EXNXgrBTWDzqYjTmHbi
         23WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXARM5b8PRMo19ZRoo8STzElhrt7AUSsZK97/gYHygs6vaFW/PsfCSfmnltaaB8CyFZRvMTFNtTrAT82wgRGLvycjv5R8d1UnzM
X-Gm-Message-State: AOJu0Yzjlbxj62B6qQl0nGL8MGSDVMFC7NUKeq4+MvowzplPZobxETmb
	lEnauwEXVAxApM5SWByowTLo1O6XWPcc5WGX0gf0fqJ3WOv3A7Vy
X-Google-Smtp-Source: AGHT+IFmQiydKHDg+5QZGpROqyuHJEfT81GJGQDnm9AdGvVwed+uKdBuMElrzWAWCTh1tNRjmQ/RXA==
X-Received: by 2002:a17:906:5a84:b0:a77:cf09:9c5f with SMTP id a640c23a62f3a-a77cf099ce8mr425339766b.37.1720354968353;
        Sun, 07 Jul 2024 05:22:48 -0700 (PDT)
Received: from [192.168.0.100] (014-189-172-081.dynamic.caiway.nl. [81.172.189.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c720a09dsm235355366b.218.2024.07.07.05.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 05:22:48 -0700 (PDT)
Message-ID: <1c6684f6-d3a8-4eaa-842d-c21fa2dd81c1@gmail.com>
Date: Sun, 7 Jul 2024 14:22:47 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, arend.vanspriel@broadcom.com,
 nikolay.nikolov@bench.com
From: Nikolay Nikolov <dobrev666@gmail.com>
Subject: [PATCH 1/1] wifi: brcm80211: brcmfmac: Prevent sdio bus going to
 sleep while transfering data
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Use mutex to prevent sdio bus to be put to sleep by the sdio_bus_watchdog
while sdio dataworker handles sdio_dpc data transfers.

Signed-off-by: Nikolay Nikolov <nikolay.nikolov@bench.com>
---
  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 6 ++++++
  1 file changed, 6 insertions(+)
---
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 6b38d9de71af..26d0bce6cedc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -524,6 +524,7 @@ struct brcmf_sdio {
  	bool txglom;		/* host tx glomming enable flag */
  	u16 head_align;		/* buffer pointer alignment */
  	u16 sgentry_align;	/* scatter-gather buffer alignment */
+	struct mutex dpc_mutex;
  };
  
  /* clkstate */
@@ -3724,6 +3725,7 @@ static void brcmf_sdio_bus_watchdog(struct brcmf_sdio *bus)
  	}
  #endif				/* DEBUG */
  
+	mutex_lock(&bus->dpc_mutex);
  	/* On idle timeout clear activity flag and/or turn off clock */
  	if (!bus->dpc_triggered) {
  		rmb();
@@ -3748,6 +3750,7 @@ static void brcmf_sdio_bus_watchdog(struct brcmf_sdio *bus)
  	} else {
  		bus->idlecount = 0;
  	}
+	mutex_unlock(&bus->dpc_mutex);
  }
  
  static void brcmf_sdio_dataworker(struct work_struct *work)
@@ -3755,6 +3758,7 @@ static void brcmf_sdio_dataworker(struct work_struct *work)
  	struct brcmf_sdio *bus = container_of(work, struct brcmf_sdio,
  					      datawork);
  
+	mutex_lock(&bus->dpc_mutex);
  	bus->dpc_running = true;
  	wmb();
  	while (READ_ONCE(bus->dpc_triggered)) {
@@ -3763,6 +3767,7 @@ static void brcmf_sdio_dataworker(struct work_struct *work)
  		bus->idlecount = 0;
  	}
  	bus->dpc_running = false;
+	mutex_unlock(&bus->dpc_mutex);
  	if (brcmf_sdiod_freezing(bus->sdiodev)) {
  		brcmf_sdiod_change_state(bus->sdiodev, BRCMF_SDIOD_DOWN);
  		brcmf_sdiod_try_freeze(bus->sdiodev);
@@ -4525,6 +4530,7 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
  
  	/* SR state */
  	bus->sr_enabled = false;
+	mutex_init(&bus->dpc_mutex);
  
  	brcmf_dbg(INFO, "completed!!\n");
  

