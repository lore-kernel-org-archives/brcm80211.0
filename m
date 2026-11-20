Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196557;
	b=DjuCrpT23+wZ6+5stoJKT7VdOMcPsmQrpSoxSEk+7WkGe5ERfIx3wFFZuNRIsMP/AhWd
	 BtVmQ3eS00QDEm2RHkk3mkKQM6CgPWRK+QfUV09YMJtlslmowi+d4lWerj33UvbC1cFlJ
	 1t+D8K7Wtl9CTIvb1zXmlk6c2hA7LlF8D5Dy3jr33HEJlRIR4fSg3YR5kaFia/knMqDM/
	 E0B4iFuGoEglF16B5NYPjZVz2RiX27GRPp1nt+C3ID14Mf6uuMivLRtPK7qDc6iOJFHzD
	 pT+FoMDGRpfruVJQaVI72xTkXKuv3iD3vYKW8RNNGsmVZOG8VxgPzvTp+DEIbdCH/rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
	b=Zw2Ung8kWKxuTUrM3Da/QtxZ3vpumlX82pAgX307rjGQPHRCXWhYcYTeBR30zx/4MijO
	 q3iiWLf56Z9ZMFXOga2SilHu4JP9Vs3u7tMBZGpVtijEVUEktBZ0Aw/gU3nnkT6GxkQET
	 ALh1Cw7FPgj+gu3Xak+TpUBi5cS9K62R6MuZ+xgGpy5JawQEOk6zMsZv+duxuDvoxZcYS
	 9o1D50tl20Kx7yODQwCUNri2+GAiQloBGe9QeQkVHLYcJsmsi/X2pwPade3cx00FjZgrG
	 zkCpqZzPy4Nv0nLbsGlKkERTXHWz4nOrcMxgFf86stHOmMF2LXPU4RSwmnTg3/a8pgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=YaghYcbQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD79606B061
	for <brcm80211@lists.linux.dev>; Fri, 20 Nov 2026 17:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD79606B061
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=YaghYcbQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so1019039f8f.2
        for <brcm80211@lists.linux.dev>; Fri, 20 Nov 2026 09:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795196556; x=1795801356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
        b=YaghYcbQJ6vSh29zpfi6dqPsQVE7rs5guvJ99ChQg6Sqejhwe28fEPf8xWFAMlHYzl
         CTbttGcteJX9vGVj27Psr0L16DTwiB4fjN0w4fJkw0NRAgOw8CT5FMbF2LxxA1URBBDL
         p3pcSI0CJC98Flmb63ckN6X6n+A97tC+h3Fzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196556; x=1795801356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcQXLHhR20hCfvjpVa526iaWuFLXqsFmhOokAK+WFKc=;
        b=odqCCfxsVdxxzDOQ7+kSHfNPTXdOI4co3X+L4KO8aFU3dXbDKSDC5rFEtKnqvCzJTM
         rLy6qH78Zmu1oG3AjfoWE+HT3SaXe7FxAovgqmVdlO4r0r6g+CKH08eh1vvm4PSP1mN7
         SucsXZaPk9nDhNVyBt/Q5fzbzgB66E1bpfPV92i88wOYIsonCajR1kvqYz5iTo8nNoTa
         da6mMGReckhqr13kTGK9ZZDyEdVaC3f2TWb5u4sgOC77aum5GYc8zQ3RNThn/NU+2bBw
         Yb5dEZAH0CSQyI8XfAziOeQoqyLe5HTDSpObNsJwt38qANh3w3A2o/O3N7yuef3BlxB4
         myZw==
X-Forwarded-Encrypted: i=1; AL+hErGEWqhVZNdA+dG24ncN9qe8AlwlK+HlUrpP6xxif/vLKx4/XmYLDjJcSmCbDrk4l44LyAL7nwOOTJM=@lists.linux.dev
X-Gm-Message-State: APuU4Z97RKMu4IRPmHShznXJi25wCHAracPbhEJ4qyVB8/S5UQdtZcYL
	Lm1Ese0TX3zWoT9KjWwUGj/bNzombDnhtqPtsmjfHuq5ToA2aBHNV1RJb85t2YQ+ZOY=
X-Gm-Gg: AZFdTZeCQfkkZbmRUzuggixxe9+vvCFezXfJ2bHH7TnEL20WFQXw5wKOMijyiP5bc1+
	MBkd++eirWZM8Tu6hYCuk228kbVKpG8iBh7L1oPX4Pxm/ijXYEZ2ScIWTJw3Q9bI/6sls4pxB1T
	ZsuRvLZUfvqHLTrTKlHGfJ3Spy2cxx3+lB6lBz4LChZiBOz6hcS7JqDrt1ojfVpaIBe3xUIt9U0
	YgHEynJqZrir2m/pSNxkUSsF5oCzij735rStNnfkmH+XO8U4cwth1135y0SunGS8QMgEfibbT9c
	QzSTXoghFb654Uqz7mXV8MP1o9yntxUnHqsEnKxqZJBukMEui3enquI0cqhZL3noCZPs2mVnhPB
	MdekcTeuhzhdTwByQVaKjSVdYnbc4Hn0Ow40bh6YIAxk1hJG2OiPreJGoIvbrTjfNNFgOMjlWWa
	m/8IyUHauJNSKwi/3Es518jv0oRuSLt+pHRt+OHmTEqHLeRLX8sfVrP5YKGiDpVV6w7Fa2pz8hU
	FxMhlf5hvxTElmb8+5E0CByS63Dq/WkWzIPzduDkBxlrpAhCIZ37YAfeW0sf416mbHhNBEc6ypZ
	Q3Z0sXYfRbyW7FrjNqqphdjGz5HvcAmS/O0hw2xl9SxouTXRcUCIk9xsONM+3eZvrPLNM90JIA8
	MEejM53wInGLxocZkPeUnAH1WLvh9l3jCbScM7Jm/HN+acuM7kY1uewX+WT6cjA/KlV/w7kk=
X-Received: by 2002:a05:6000:470e:b0:4aa:323a:d7b7 with SMTP id ffacd0b85a97d-4abb16e310bmr8421955f8f.23.1795196555630;
        Fri, 20 Nov 2026 09:42:35 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm6597356f8f.38.2026.11.20.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:42:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Benjamin Drung <benjamin.drung@canonical.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: brcmfmac: fix use-after-free of the watchdog task_struct
Date: Fri, 20 Nov 2026 18:42:27 +0100
Message-ID: <20261120174231.2024897-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

The watchdog thread exits as soon as it receives a SIGTERM, also from
userspace, e.g. when init kills all the processes at reboot. If the
driver is removed afterwards, the reference taken right before sending
the signal by commit c623b6358088 ("wifi: brcmfmac: Fix potential
use-after-free issue when stopping watchdog task") comes too late, and
kthread_stop() runs on a task_struct already freed.

  WARNING: kernel/kthread.c:84 at kthread_stop+0xd8/0x190
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  Call trace:
   kthread_stop+0x148/0x190 (P)
   kthread_stop_put+0x14/0xb0
   brcmf_sdio_remove+0x58/0x1d0
   brcmf_sdiod_remove+0x20/0xa0
   brcmf_ops_sdio_remove+0x5c/0x90

Take the reference before the thread is started and drop it with
kthread_stop_put() when it is stopped.

Fixes: c623b6358088 ("wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task")
Cc: stable@vger.kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index cea52d408817..67b2291f8ee5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -2478,7 +2478,6 @@ static void brcmf_sdio_bus_stop(struct device *dev)
 	brcmf_dbg(TRACE, "Enter\n");
 
 	if (bus->watchdog_tsk) {
-		get_task_struct(bus->watchdog_tsk);
 		send_sig(SIGTERM, bus->watchdog_tsk, 1);
 		kthread_stop_put(bus->watchdog_tsk);
 		bus->watchdog_tsk = NULL;
@@ -4500,12 +4499,16 @@ int brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
 	timer_setup(&bus->timer, brcmf_sdio_watchdog, 0);
 	/* Initialize watchdog thread */
 	init_completion(&bus->watchdog_wait);
-	bus->watchdog_tsk = kthread_run(brcmf_sdio_watchdog_thread,
-					bus, "brcmf_wdog/%s",
-					dev_name(&sdiodev->func1->dev));
+	bus->watchdog_tsk = kthread_create(brcmf_sdio_watchdog_thread,
+					   bus, "brcmf_wdog/%s",
+					   dev_name(&sdiodev->func1->dev));
 	if (IS_ERR(bus->watchdog_tsk)) {
 		pr_warn("brcmf_watchdog thread failed to start\n");
 		bus->watchdog_tsk = NULL;
+	} else {
+		/* The thread may exit on a SIGTERM before it is stopped */
+		get_task_struct(bus->watchdog_tsk);
+		wake_up_process(bus->watchdog_tsk);
 	}
 	/* Initialize DPC thread */
 	bus->dpc_triggered = false;
@@ -4576,7 +4579,6 @@ void brcmf_sdio_remove(struct brcmf_sdio *bus)
 	if (bus) {
 		/* Stop watchdog task */
 		if (bus->watchdog_tsk) {
-			get_task_struct(bus->watchdog_tsk);
 			send_sig(SIGTERM, bus->watchdog_tsk, 1);
 			kthread_stop_put(bus->watchdog_tsk);
 			bus->watchdog_tsk = NULL;
---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: brcmfmac-wdog-uaf

-- 
2.43.0

