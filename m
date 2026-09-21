Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1474E2F25
	for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025503; cv=none; b=UFycWhIJ1oCMxbvqFX8fCUswxQ8SQa272im/8ZjISzndUgQCnNHM1VHqPgSy2KZAaj7uCNaZ2n1U/LJ65ezDVHs6dohh1eTdX0nory6ti+jNPULF79K6gMvK2KmmYXY75PXNCd8XbuuZFCEm0l3Xl8/L4Ba7QWbzBPhnnZXIhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025503; c=relaxed/simple;
	bh=qqUhYyhh0lWhKWnrQLYI0jwX7c0FSpVeehdl6bHeJFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lmvqSi7TliSDOSNPkKtEGPWeiHurdu01NO7FqHv/jPbP5zjRmbCYZwdKUjaM7wzhI/djwkjXt8H7Bnd/oHEMq8wcS92+f5V8P4nHzETlbnF33EiKSPB8uvs/Q0EZxzMDelJtv7JLnH7RKZHSuEoqwMCckLuRXwMcCUMfvc/YVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=1od0JZOo; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="1od0JZOo"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so14983681cf.3
        for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025500; x=1790630300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1DBFyCtj/TBpWi0ynhywHcDx+OLl9aX7xs9S/Wz1mw=;
        b=1od0JZOo8POfDsqin6TU9hQfXWbUQanXMGXDVWZPsJ81M/o/5q4eSHNeYAZ/JupN4Q
         p0KLwBnxMgwNBGrK11dVew9uP46B+HPrLqF21xJW35ehLq7Wxc2jFFTNVU26zs+XFA/v
         EJf6s0yY4Z/hX+BbNU5TCvyhBDxeC6wZXW4ytYDOi4XdOMxr5YcFvKF/tH5Gp5Nj4Pd9
         fj+8kcqZR767b0inBes11oZwjnGaAFHAP7Gbe1mgcRGccWRCoztRKM0F5pYDGR6JPZi2
         W2J8hwmAbHfHMnhEAZp/8J/+fM61qUVvyt3nzA+vSvtyTHgCbneEV8yjpNtl6MzJ1gjE
         rI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025500; x=1790630300;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1DBFyCtj/TBpWi0ynhywHcDx+OLl9aX7xs9S/Wz1mw=;
        b=sfmsY0P2+blgOBXg4MVSwd8rrIsNCtn2VgKoOg1tv44XwQ0fQJcf2CU/a1DxeMKxy0
         tgVsqq/IoDrDFOHKAWbPi1NKzV/lToQC3iWhdO7jbE3ZbDj2flzFQEgMCWg7iu4Vxi5K
         h3am3HM/GYLWXi/20wROIJ6b3Oc+Kharnr1JFFgrft/SCU/gEHrwX5Mxnq/kJieS/KGY
         /s5G1O11sAESI+7jISonvnanVb6tHN76SuCcO7WenKfV6t66km9ZICIorfZRv0Ip9aZt
         Lruu5C9T9OD78Dza6M4SI9rhpr8rBhfWjAlUClQx6R3a/mdl93bauiSwot1bC11dJMS+
         OHdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtsTsdE/Z3F7Yvg36mD3gRxEKOWFB7k/4pqoKQm59zZe67RlWmj3bhoXvY7vTaLSiafnssaXXzPjo=@lists.linux.dev
X-Gm-Message-State: AFuF++m0Ahcu3WchRLPfXhm+AWary8VhZ4iWCA+/eB4ZNqJQ0C8vRtkq
	7u1tlaf+J3RThksBwN2GbcBdR1YDQWTPRG5e2nOdQlyrYJFzisomvOpJuyMOThIOf37ohQbgjYv
	MFpHCzI2360cJ4qNIkA273eOo8pMr8ZGAdB8SZcgKDBwt1H/QVgErBjs=
X-Gm-Gg: AYBFou2JfXOMbGtg5ajuC+DFXISCiDuB/j40O67CVhRfDWNalOmnbXeqrImWVbe6GFF
	icYYZsA94y6sSVPjMBcspqkk/22nuuuK56Yaf62lH0M1trWpDlUjJ3OzZAQOyj7G9RXYs3X7pT8
	DKO1Jeduc+SJ+L00lfk23qq9RB62O7lDWHufOiVCkpGlnjn2YM9z+S3/6zcmx9AxTGRE83cW/J+
	LcGtDrj7D0yCpmmvl7MsQO+TUvwHewzfKlAI/G3tLlBnZ4EwsNylHiZjFHioMOXamTx76k/2WGV
	wfjZgoI0MgVne9cvYkUorm+aNxEm7IAz848oQTf4iEvqgo/4H+JQl7LfNari7EDxHrr7rsbNWup
	HgfA+8j/GVrK9QFbMwIHyV1WadnoGHOzvWJJEjjVa1RV+GIsrwbBs4WTSvg5xr49qKTSWViP0Cf
	5g/uVO7gDbGO5HuN3mYaZmsitklQm0oZFYBl+0W3S/2FIAkXG9YDt6f7axn2oiL90=
X-Received: by 2002:ac8:5882:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-532d8d3182bmr26212061cf.4.1790025499820;
        Mon, 21 Sep 2026 14:18:19 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:19 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"John W. Linville" <linville@tuxdriver.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	driver-core@lists.linux.dev
Subject: [PATCH 0/4] wifi: brcmfmac: Fix bugs when the device is removed before firmware is loaded
Date: Mon, 21 Sep 2026 17:18:10 -0400
Message-ID: <20260921211817.2432341-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I was working on a different bug, and I noticed that brcmfmac tends to
crash quite spectacularly when the device gets removed before the
firmware request completes. This is because brcmfmac does quite a lot of
initialization that would be normally be done in probe() only when the
firmware is loaded. I found two general classes of bugs:

- Some of the remove paths try to clean up things that the firmware
  request callback sets up, which doesn't work too well if the firmware
  isn't loaded (patches 1 and 2).
- The firmware request callback generally assumes that the driver is
  still alive and kicking. So if it runs after the driver is removed it
  will procede to access all sorts of memory after it's been free'd.

A fairly-reliable way to trigger these bugs is to edit really_probe in
drivers/base/dd.c and replace

    IS_ENABLED(CONFIG_DEBUG_TEST_DRIVER_REMOVE)

with

    !strcmp("brcmfmac", drv->name)

Alternatively, you can use the name of the bus's driver.

I have only tested these fixes on SDIO. I would really appreciate if
someone could test this series on PCIe with the above snippet in their
kernel (preferably with KASAN).

Right now if the firmware cannot be loaded for whatever reason then the
firmware request callback will unbind the driver. This is incompatible
with canceling the firmware request and waiting for it to complete in
the driver's remove() callback. As such, I removed this behavior so the
device now sticks around even if we can't load the firmware. If this
behavior is really, truly desired then we can drop device_lock while
waiting for the firmware request to complete and attempt to recover from
the consequences.


Sean Anderson (4):
  wifi: brcmfmac: Fix canceling uninitialized datawork
  wifi: brcmfmac: Fix brcmf_pno_detach NULL-pointer deference
  firmware_loader: Return status from request_firmware_nowait_cancel
  wifi: brcmfmac: Fix firmware requests racing against SDIO removal

 drivers/base/firmware_loader/main.c           | 11 +++++---
 .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  7 ++++-
 .../broadcom/brcm80211/brcmfmac/bus.h         |  2 ++
 .../broadcom/brcm80211/brcmfmac/core.c        |  3 +--
 .../broadcom/brcm80211/brcmfmac/firmware.c    | 26 ++++++++++++++++---
 .../broadcom/brcm80211/brcmfmac/firmware.h    | 16 +++++++++++-
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 11 +++++---
 .../broadcom/brcm80211/brcmfmac/pno.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/sdio.c        |  8 +++---
 .../broadcom/brcm80211/brcmfmac/usb.c         |  6 +++--
 include/linux/firmware.h                      |  2 +-
 11 files changed, 75 insertions(+), 19 deletions(-)

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
branch: brcmfmac_firmware_cancel

-- 
2.53.0

