Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916057;
	b=RI+glKkjeSuml3YSdPAm1VYTJkzmqfyRjWDSQet2BmT3T9nuJSfqXu3JD8f7DaT9Mzje
	 XFHH7E8BzWJ3BLZebf62gBpVWS9Xw8fwajtQpahW2vAWpd/o6UZdDl95ArEW447StEXeg
	 +FqUeYto0luPjDUHZ5E0ahktGWnwzgUssIFHlMgsK97t2PQmSO13DvhZExraBuUt88fYR
	 1aR5Jl7/sw+WNoMuvhSR07X1Tcst5oZg+n8hhatlkaLRjt9Pey9G5aqEBeW3cIoKsc6qk
	 XLp+f4NWy3ikNO13mXTstwlTeonPJfysfiTaKTDRGrUElt60a+jnGPRMsKtgevhakxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7JEnT0whAk4GTsqtOJMLoD+zA06WiG1bCm/NekxzR6k=;
	b=hpmC2lKIlvorMV3PnbrbnjXJuYRn9/Yj4nzqcoF7Zehbz/65hFJM3sUiPNsXazPNgijy
	 LwF+HJmc3LbsE8cFlAW5EnoQoDeXvs/ZAnAnZf3a6VgvUfOSRYPS1a93vetoF2BCyVLAo
	 1Rux6MP7sl47Kqce05Wgkm+fR9AOytF8B2Fw6t1nHWeB9r0FIA8vHb9arwnmbL6m9IxmN
	 zaWaksHCPkyy20EG0bttCA8m2Djo9EJCTRw1TqmqRqBEt2c9AOZ2K+b40ZNxUdNSYQ7Qb
	 sPPHlcUhLu65MR8eX0+U9JV7E3yy3LAD/IKywLLviaj4TKuvvIi8/DsEepRBm7/yWBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gH4F/RrL";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29267606A330
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 22:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29267606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gH4F/RrL
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so31648f8f.2
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 14:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793916055; x=1794520855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JEnT0whAk4GTsqtOJMLoD+zA06WiG1bCm/NekxzR6k=;
        b=gH4F/RrLh03wU2hKN8v/uvMXN3xH02aoiX9c6GehFuIwX73Es32eJjXww+/ZNLo97Z
         qoJlkGLu/NK+2PN2yjn2c+1xCt5jXMc2qIbo9jaeLWCIvsuEgqJrVIjo8WIyHhSnr8b7
         DzeJx8sNxHgHZr5Kp7UlyEJTftbVSW+V3cZSPwE/3kQLmSfr+18uvhNDt+tFDL6RYqW9
         ybo59ZsZZZRUwm+tPLecqqAWiN5MwRYwgnTj/4u6kdUReu1ZSK6WXTRxSjWdTO1k/oQl
         1rYGC6U+gtAq6H4EBEK5MWgN8+L5Iz8VEDE7kt93+XBQp++CatUuZtLttP/n7jqSIIUB
         DK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916055; x=1794520855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JEnT0whAk4GTsqtOJMLoD+zA06WiG1bCm/NekxzR6k=;
        b=ulsZE6YEaxUFTkLZhFcES/m0q0HMecIrq/VH3X5EA3KJX55eebyO20ZOf2Sw21U7rm
         zfVJv8O/oYjkEu/SzuBffKzcAUphFbRZ1s1i8KMwo+6WVabxS7BRlnLjtoKV/7Slzi6z
         jR3iA/Wj5awAvbsZ7FxlQ/3l7KVGBYNDWE8c6rGSdiv1bxvYwEaWlctGwlEDoAX5GGI9
         BK7g5T0IS/4eLEsEsGOhlqIyv4WMcNVHKgKdVxoTjDgJDfDbDIbfppBx53C8n4z/maqa
         FxIOYm5ou9YjxJ+rMnafelI2wxfdNOQ82UxaGXG4pF2KXaoYSLxblk3uKIZt5TU9krZJ
         h3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkMCQI6FovMaRBJ/7KPVY++CNIM+3YYtFC/KCPfDMK89VlXOxgQ1y75NXFMrwFUeieAZ0SyipRyXA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+lAA8Uhgmq3wFFFLE5jN14KiHe3bQANNwvr3zZ904Ygi4NDDnc
	R7eIk+wxh1sr4Y7v+AP3MBXx+e61MmITqteDj0AjB8qXP17hqu0o2ZDgtA0bRIwDok8=
X-Gm-Gg: AYBFou2Sn5IydpAx5z43ctN/NH/eM/aDBnYXd6bq9dfsrlaCmWFZpauWA1hVqXbPImF
	biPjQHQkUxUCNkdgBtSDeiQkVlJaxSJh/uz6sBVL1NXWlYo248o8oWcySArKAqvqQfpxhUB2d/K
	610V8ymsnkeA39cS9cmXZuFnROVSfrbGHpCEhJaASvcFyYIJgHqT5BdIXG07kRCnPIs/BWsSjHl
	8Ph+GkHb1xGniWsXZwW+eNkamq+0W6CJWuugHRy6pIi7BD+jqwT+DADLcKFnKLKdUQ5HHu0hbIe
	fL4AMxOIg/RaS2nOFRPC+w+qhITDn4Sv0NaXmEUiGZeNanUHZjIemfhaNKf20UBPyRgWJHVmovu
	cZOIb6UHCwdd8/aHNH9R9lfIQ1zHH3ytQbXrXVVAinpMddpT5HQwLRudW4wuLBHXk7U1H6Kjhao
	gppOOziGc731HMr8snt00Z2q9g0fdDFhNKfiyNgP7+Uz0o2Dh+/QyKPfJdWpamU/VPm2Trdwa9P
	/54E1JgB+SU2jpB37taPdYCibijKWbN6g3/zHNynfk+/K+jEzmzu3MVBnwwOxGVHW4UbSYL+iTx
	iUgAJC1mVCW46Fkd/zj2gjOavGCS5ZopgHCGXkQ1a5Td6UBGaC6WePFNkAtXRph9EbJrQbIf9wb
	oeJhSa6dZ
X-Received: by 2002:a5d:5887:0:b0:492:880f:494e with SMTP id ffacd0b85a97d-492880f4996mr1214831f8f.40.1793916055427;
        Thu, 05 Nov 2026 14:00:55 -0800 (PST)
Received: from soeren-MS-7A32.tail37253f.ts.net ([2001:a61:13ae:e301:329c:23ff:fea4:379])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm11922212f8f.48.2026.11.05.14.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:00:55 -0800 (PST)
From: Soeren Coremans <sorencoremans@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Soeren Coremans <sorencoremans@gmail.com>
Subject: [PATCH wireless-next 3/3] wifi: brcmfmac: pcie: recover from fatal PCIe errors
Date: Thu,  5 Nov 2026 22:59:54 +0100
Message-ID: <20261105215954.184290-4-sorencoremans@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105215954.184290-1-sorencoremans@gmail.com>
References: <20261105215954.184290-1-sorencoremans@gmail.com>
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

brcmfmac registers no pci_error_handlers, so a fatal AER error leaves
the device dead until reboot ("AER: can't recover (no error_detected
callback)"). On a BCM4366 this happens after some firmware traps: the
trap starts a driver reset, and about 0.7 s later the downstream port
reports an FCP error.

Add error handlers:

- error_detected: mark the bus down, block the driver's own reset work
  and request a link reset.
- slot_reset: restore the config space saved at probe, then check that
  the backplane answers; a wedged card would stall the CPU on every
  MMIO read during firmware download.
- resume: re-probe the device from a work item. The link reset returns
  the chip to its power-on state, which brcmf_pcie_reset() does not
  fully re-initialise: after it, association failed in 5 of 9 runs,
  while 16 of 16 re-probes recovered.

A dongle setup that fails while recovery is in progress no longer
releases the driver, as that would race with the re-probe.

Tested with aer_inject (FCP on the downstream port), alone and 0.3 s
after a debugfs-triggered reset: WiFi back within 6-12 s in 16 of 16
runs, on a BCM4366/4 (14e4:43c3) with a kernel built from the
Ubuntu 7.0.0-42 source, which is based on v7.0.14.

Also tested against real FCP errors, without injection: resets under WiFi
traffic caused 3 in 47 runs, and all 3 recovered within 4-11 s.

This relies on the console read fix earlier in this series: without it,
a reset that is already running on the dead device never finishes, and
error_detected() waits for it forever.

Found and written with the help of an AI coding assistant (Claude Opus
5.5); the cover letter describes how.

Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 128 +++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 5abc85013110..9c23e5b83b73 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -344,6 +344,7 @@ struct brcmf_otp_params {
 struct brcmf_pciedev_info {
 	enum brcmf_pcie_state state;
 	resource_size_t tcm_size;
+	bool in_pci_recovery;
 	bool in_irq;
 	struct pci_dev *pdev;
 	char fw_name[BRCMF_FW_NAME_LEN];
@@ -2137,6 +2138,7 @@ static int brcmf_pcie_get_resource(struct brcmf_pciedev_info *devinfo)
 	}
 
 	pci_set_master(pdev);
+	pci_save_state(pdev);
 
 	/* Bar-0 mapped address */
 	bar0_addr = pci_resource_start(pdev, 0);
@@ -2598,6 +2600,11 @@ static void brcmf_pcie_setup(struct device *dev, int ret,
 
 fail:
 	brcmf_err(bus, "Dongle setup failed\n");
+	/* PCIe error recovery is in progress and re-probes the device once
+	 * the link is back; releasing the driver here would race with it.
+	 */
+	if (READ_ONCE(devinfo->in_pci_recovery))
+		return;
 	brcmf_pcie_bus_console_read(devinfo, true);
 	brcmf_fw_crashed(dev);
 	device_release_driver(dev);
@@ -3153,11 +3160,117 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
 MODULE_DEVICE_TABLE(pci, brcmf_pcie_devid_table);
 
 
+static pci_ers_result_t brcmf_pcie_error_detected(struct pci_dev *pdev,
+						  pci_channel_state_t state)
+{
+	struct brcmf_bus *bus = dev_get_drvdata(&pdev->dev);
+	struct brcmf_pciedev_info *devinfo;
+
+	if (!bus)
+		return PCI_ERS_RESULT_DISCONNECT;
+	if (state == pci_channel_io_perm_failure)
+		return PCI_ERS_RESULT_DISCONNECT;
+	if (state == pci_channel_io_normal)
+		return PCI_ERS_RESULT_CAN_RECOVER;
+
+	devinfo = bus->bus_priv.pcie->devinfo;
+	brcmf_err(bus, "PCIe link frozen, resetting\n");
+	WRITE_ONCE(devinfo->in_pci_recovery, true);
+	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
+	brcmf_bus_cancel_reset_work(bus);
+
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t brcmf_pcie_slot_reset(struct pci_dev *pdev)
+{
+	struct brcmf_bus *bus = dev_get_drvdata(&pdev->dev);
+	struct brcmf_pciedev_info *devinfo;
+	u16 vendor;
+
+	if (!bus)
+		return PCI_ERS_RESULT_DISCONNECT;
+	devinfo = bus->bus_priv.pcie->devinfo;
+
+	pci_restore_state(pdev);
+	pci_save_state(pdev);
+	pci_set_master(pdev);
+
+	pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
+	if (vendor != pdev->vendor)
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	/* Config space can answer while the backplane is wedged; reloading
+	 * firmware into such a card stalls the CPU on every MMIO read.
+	 */
+	if (devinfo->ci) {
+		u32 chipid;
+
+		brcmf_pcie_select_core(devinfo, BCMA_CORE_CHIPCOMMON);
+		chipid = READCC32(devinfo, chipid);
+		brcmf_pcie_select_core(devinfo, BCMA_CORE_PCIE2);
+		if (chipid == 0xffffffff) {
+			brcmf_err(bus, "card not responding after link reset\n");
+			return PCI_ERS_RESULT_DISCONNECT;
+		}
+	}
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static struct workqueue_struct *brcmf_pcie_err_wq;
+
+struct brcmf_pcie_reprobe {
+	struct work_struct work;
+	struct pci_dev *pdev;
+};
+
+static void brcmf_pcie_reprobe_worker(struct work_struct *work)
+{
+	struct brcmf_pcie_reprobe *rp =
+		container_of(work, struct brcmf_pcie_reprobe, work);
+	int err;
+
+	err = device_reprobe(&rp->pdev->dev);
+	if (err)
+		pci_err(rp->pdev, "re-probe after PCIe error failed: %d\n", err);
+	pci_dev_put(rp->pdev);
+	kfree(rp);
+}
+
+/* A link reset returns the chip to its power-on state, which only a full
+ * probe initialises correctly. The re-probe frees all driver data, so it
+ * runs from a work item that holds nothing but the PCI device.
+ */
+static void brcmf_pcie_resume_from_error(struct pci_dev *pdev)
+{
+	struct brcmf_bus *bus = dev_get_drvdata(&pdev->dev);
+	struct brcmf_pcie_reprobe *rp;
+
+	if (!bus || !READ_ONCE(bus->bus_priv.pcie->devinfo->in_pci_recovery))
+		return;
+
+	rp = kzalloc_obj(*rp);
+	if (!rp)
+		return;
+	brcmf_err(bus, "PCIe link recovered, re-probing\n");
+	INIT_WORK(&rp->work, brcmf_pcie_reprobe_worker);
+	rp->pdev = pci_dev_get(pdev);
+	queue_work(brcmf_pcie_err_wq, &rp->work);
+}
+
+static const struct pci_error_handlers brcmf_pcie_err_handler = {
+	.error_detected = brcmf_pcie_error_detected,
+	.slot_reset = brcmf_pcie_slot_reset,
+	.resume = brcmf_pcie_resume_from_error,
+};
+
 static struct pci_driver brcmf_pciedrvr = {
 	.name = KBUILD_MODNAME,
 	.id_table = brcmf_pcie_devid_table,
 	.probe = brcmf_pcie_probe,
 	.remove = brcmf_pcie_remove,
+	.err_handler = &brcmf_pcie_err_handler,
 #ifdef CONFIG_PM
 	.driver.pm = &brcmf_pciedrvr_pm,
 #endif
@@ -3167,8 +3280,17 @@ static struct pci_driver brcmf_pciedrvr = {
 
 int brcmf_pcie_register(void)
 {
+	int err;
+
 	brcmf_dbg(PCIE, "Enter\n");
-	return pci_register_driver(&brcmf_pciedrvr);
+	brcmf_pcie_err_wq = alloc_workqueue("brcmf_pcie_err", 0, 0);
+	if (!brcmf_pcie_err_wq)
+		return -ENOMEM;
+
+	err = pci_register_driver(&brcmf_pciedrvr);
+	if (err)
+		destroy_workqueue(brcmf_pcie_err_wq);
+	return err;
 }
 
 
@@ -3176,4 +3298,8 @@ void brcmf_pcie_exit(void)
 {
 	brcmf_dbg(PCIE, "Enter\n");
 	pci_unregister_driver(&brcmf_pciedrvr);
+	/* Unregistered first so no new re-probe can be queued; this drains
+	 * a pending one before the module text goes away.
+	 */
+	destroy_workqueue(brcmf_pcie_err_wq);
 }
-- 
2.53.0

