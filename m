Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783279;
	b=NBSGlhbMMNiJLhNo1yiDnWOrgXn1ye0UhzEepB4sKoPMDQr7fqWAOj/gJU+2PrRpuKYQ
	 9V++PxuzHK4mFjJWYkDQ8URaH1SRKXC2XATiOehZbhRu7BjKFE4Jfxg0MTT6KR+JEsdBW
	 UBJjRxF1GSddJz4DMIx3NtRGYUo2FQ/sCpsyWVzCOOKFTObTNp+X46m5EgorMpImvj56e
	 a0jekS4tkBwJS/6DdeLi6lgGpGLMORZjq/PMCZrGsprsPRXetIHXNBb/q+85O9Z05f9iB
	 kezb/HBP2phpTb73S/A5oU8hlv5SNbi5WfJ1C4T+RR5hr9gRdpw353AMl10WB6kVCug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783279;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eX6gJ0iscZo1BB9Xa3fh4lrVWE3eJqEgbd+v9mVJVrQ=;
	b=jh2pCjhCn7wENca7BW0v8Dc3TrVaZ9qRJVhhPZPiQ0JhmSl/oeIHaAmZSFKgZV/cVbVO
	 ZrtDZG4M89DajGBWLHLj5lv/SPft0UD7iPSOx7HBdHPi3i8lf8aSIX3iYiAzDTU7QLbsh
	 ivnRJO/fnLhT9f8sV6JbEa/2zCSvvIR5Vj+a/cf+xvpeWWBGCVPef70i0jTs3WuEsND2V
	 vdri9fhOSKfVU3KSQ+ds5YB980HSUP80oi82jlKXTurJ0KlPybggXPP4XD2q54cHQdzac
	 o7BBywryqPazl+eK8/zbaRbdhxzLq7TVi8FsUiqWZPpkuQzUQJ1prPSWReOl4Wv7vNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=V1FLBP22;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09B606A31E
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 12:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A09B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=V1FLBP22
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: f84dbf45-9960-419e-84e1-fcf5f671425f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783268;
	bh=8RNe0Rwtih60NEpEg71UxdWReXv1JDIgl698y5PYhOM=;
	h=From:To:Cc:Subject:Date:From;
	b=V1FLBP22VeOaPyHa7WHncaY1jgwElfaHgJpLhLnqpwuX69rAbukzZMqHexTev5H8y
	 i/qYblposHEF4p4ZRwD19jMaZXDMqjPNwZu+YLIuYdDq2Ng69MdbTiQthxJQC5hKsT
	 wj6CMECvWTdU7cL4bcaTjDBoH3SgiogdUw0DEJOG95xNjnjIGRA8WqDjYavcb0SvCc
	 WwNmwUijTREsJmU6zGyKSQ3eqlLoRrxo6+0oeQrRHwGIM5sjLaP607UWdifsVmsMew
	 tH9AiMcX3Q3xD0UoEMrkQ0DpQ5wYXwreafhDmFttrMyneefB47k4FkvDJ1Qps83xfw
	 f1/oy79AJoe3A==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH wireless-next v3 0/6] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
Date: Fri, 27 Nov 2026 13:40:58 +0100
Message-ID: <20261127124104.233236-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
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

This series adds AWDL support to brcmfmac, so Linux on the Apple T2 Macs
can send and receive files over AirDrop with Apple and latest Google or
Samsung devices.

On these Macs the Apple firmware runs AWDL itself. The host creates an
AWDL interface and sets its parameters, the firmware keeps the AWDL
schedule and carries the AWDL frames and data. Election, peer discovery
and AirDrop run in user space, which talks to the driver through vendor
commands and events of the Broadcom OUI. As discussed on v1, vendor
commands are the exception agreed for AWDL, so the vendor header
becomes ABI with this series.

The user space side is t2-drop, published under GPL license

  https://github.com/kaiT2en/KaiT2en-Fedora/tree/main/apps/t2-drop

Tested on a MacBookPro15,1 (BCM4364, firmware 9.30.514.0.32.5.94) with
a MacBook Air M4 as peer. AirDrop in both directions with varying file
sizes up to 2GB.
v2 runs on the BCM4364 and BCM4377 machines of the T2 Linux community.

Changes in v3:
- awdl.c and awdl.h are ISC
- Patch 3: keep the abandoned AWDL interface until its late event is
  claimed, and take an interface event that arrives right after the
  timeout instead of failing
- Patch 5: remove an AWDL interface the firmware removed on its own from
  a work item with RTNL and the wiphy mutex. Then send AWDL_STOPPED.
  Answer a START dropped before system sleep with -ECANCELED. Document
  that SET_SYNC fails with -EBADE while the firmware does not know a new
  master yet
- All patches except 3 and 5 are acknowledged by Arend

Changes in v2:
- Drop v1 patch 1, wireless-next matches the firmware capabilities as
  whole words already
- Rebase on wireless-next, patches 1, 2 and 4 have Arend's Ack
- Patch 3: remove an AWDL interface that shows up after the interface
  event timed out, tie the network device to the wiphy device in sysfs
  and keep its name, keep the AWDL address out of the ARP offload table
  of the primary interface, kernel-doc for the return values
- Patch 4: add the AWDL header in brcmf_netdev_start_xmit(), so tx and
  rx count the bytes of the Ethernet frame, kernel-doc. The MTU stays at
  1500, the firmware takes full size frames with the added header
- Patch 5: document where the parameter tables come from and the
  firmware versions they are used with, fail AWDL_START when awdl,
  awdl_config or slot_bss are rejected, return firmware errors from
  SET_FRAMES and SET_SYNC, a quirk in feature.c instead of the chip
  check, reject AWDL_STOP while a start is queued, AWDL_STOPPED with
  -ENOLINK when the firmware removes the interface, UNSPEC first in the
  vendor events
- Patch 6: abstract event codes for the AWDL events, mapped and
  registered by the WCC vendor module, log dropped events

v2: https://lore.kernel.org/all/20261125190254.176055-1-dev@deq.rocks/
v1: https://lore.kernel.org/all/20261104151547.70333-1-dev@deq.rocks/

Andre Eikmeyer (6):
  wifi: brcmfmac: move the interface_create definitions to fwil_types.h
  wifi: brcmfmac: detect AWDL support of the firmware
  wifi: brcmfmac: create and remove the AWDL interface
  wifi: brcmfmac: add the AWDL data path
  wifi: brcmfmac: add vendor commands for AWDL
  wifi: brcmfmac: pass AWDL frames and role changes to user space

 .../broadcom/brcm80211/brcmfmac/Makefile      |    3 +-
 .../broadcom/brcm80211/brcmfmac/awdl.c        | 1163 +++++++++++++++++
 .../broadcom/brcm80211/brcmfmac/awdl.h        |  123 ++
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   49 +-
 .../broadcom/brcm80211/brcmfmac/core.c        |   82 +-
 .../broadcom/brcm80211/brcmfmac/core.h        |    7 +
 .../broadcom/brcm80211/brcmfmac/feature.c     |   32 +
 .../broadcom/brcm80211/brcmfmac/feature.h     |    8 +-
 .../broadcom/brcm80211/brcmfmac/fweh.c        |   19 +
 .../broadcom/brcm80211/brcmfmac/fweh.h        |    7 +-
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  |   46 +
 .../broadcom/brcm80211/brcmfmac/vendor.c      |   90 ++
 .../broadcom/brcm80211/brcmfmac/vendor.h      |  109 ++
 .../broadcom/brcm80211/brcmfmac/wcc/core.c    |   39 +
 14 files changed, 1723 insertions(+), 54 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.56.0

