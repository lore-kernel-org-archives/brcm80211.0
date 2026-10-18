Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [51.250.60.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B73C6A56
	for <brcm80211@lists.linux.dev>; Sun, 18 Oct 2026 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.60.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792352411; cv=none; b=aHdHT4WUoC8YrULUAcNf9x0nt53WCeTbIEQ1O2b5xO4qC+uP4v5WJlFPjTG4gyBoYYbgi4EMtqBZPM2ncF7VDJFkL8JT3EKqrEPts3uq7KCiFP/0cxzvHBFWtq0+EFowcx/x4EnjX28HnXSDtBnd8L1ELl+PyOoinJNIhlLCNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792352411; c=relaxed/simple;
	bh=yxYOAbEakTQK/EKwd4BmwkwcRlAv5edH4vJzvWRVHUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bVnwT9ApFGglIkyE2e1fViJNDP9Gya2cSCoC6iFSD/MB4LhomxnU6WNkPwLByyId7JEVyes5qDk8gvuzbcZNMjualFYeeGvkGsQGeu2mkAStBF7j4RC3H8TWV32PkyrAOiloycYPO8SgHQuRkwiRabooP55wu2Xs/mSWoPegp84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=JZ1je3CY; arc=none smtp.client-ip=51.250.60.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="JZ1je3CY"
Received: from mail-nwsmtp-smtp-production-main-73.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.yp-c.yandex.net)
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 471F7C0040;
	Sun, 18 Oct 2026 22:39:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73 with ESMTPSA id odeNcANdeeA0-XJHspWh3;
	Sun, 18 Oct 2026 22:39:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1792352397; bh=rI30WXEYUgaFP2Fijjd2kWABcP/25zubdRs8pQsEkZY=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=JZ1je3CYoGU1ocZwJNz9o7sWvY8R8EfWMizkN9hKsYjclnftQbJ3PVoCEHyqhQK82
	 pcfuG6L7LDEp0fSdRNHdtfANwFgcu0JKyfBwztaKneXdG9IjDWOlvhfdKyDnkA807B
	 gMfCuWhU/BZzfjRVcU5WXTc98lA2dP5fWt89V8cY=
Authentication-Results: mail-nwsmtp-smtp-production-main-73; dkim=pass header.i=@yandex.ru
From: Sergey Armodin <dolph-in@yandex.ru>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH wireless-next] wifi: brcmfmac: pcie: restore FEM control pin mode on Apple BCM43602
Date: Mon, 19 Oct 2026 02:39:50 +0700
Message-ID: <20261018193950.14287-1-dolph-in@yandex.ru>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a MacBookPro14,3 with a BCM43602 (14e4:43ba, subsystem 106b:0173),
5 GHz stops working once the chip has been reset to its power-on
state, which happens over S3 while running on battery. Scans still
report 5 GHz networks, but every attempt to join one fails: the
firmware ends the join with a SET_SSID event with status
BRCMF_E_STATUS_FAIL and no LINK event, which brcmfmac reports as
WLAN_STATUS_AUTH_TIMEOUT, seen in wpa_supplicant as
"CTRL-EVENT-ASSOC-REJECT ... status_code=16". A 2.4 GHz network could
still be joined in that state. Reloading the driver, power cycling
the slot or a secondary bus reset do not help; only a reboot of the
machine does.

On this board 5 GHz depends on bit 4 of the ChipCommon chipcontrol
register, which Broadcom's sbchipc.h calls
CCTRL4360_DISCRETE_FEMCTRL_MODE (front-end module control through the
discrete FEM control pins). After a reboot the bit is set. brcmfmac
never writes it and firmware 7.35.177.61 does not set it after a
power-on reset, so presumably the platform firmware sets it at boot.
The watchdog reset brcmfmac does on probe and remove preserves the
bit, but a power-on reset clears it: power cycling the slot of a
working system breaks 5 GHz the same way. Read with the driver unbound
after the firmware has run, chipcontrol is 0x01400010 after a reboot
and 0x01000000 after S3 on battery. Bit 22 is lost as well, but
setting bit 4 alone before the firmware is downloaded is enough to
make 5 GHz work again.

Set the bit, if it is clear, before downloading the firmware on
BCM43602 boards with Apple's subsystem vendor ID. When the firmware is
lost over a resume, brcmfmac removes and probes the device again, so
this covers S3 as well as a driver reload. This was only seen on a
MacBookPro14,3; the check covers all Apple BCM43602 boards on the
assumption that their platform firmware sets the bit the same way.

Tested on a MacBookPro14,3 with firmware 7.35.177.61: after power
cycling the slot and after S3 on battery the driver sets the bit and
5 GHz associates again; after a normal boot the bit is already set and
nothing is written.

Signed-off-by: Sergey Armodin <dolph-in@yandex.ru>
---
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 17bae04c1..a97a597e7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -726,9 +726,39 @@ static void brcmf_pcie_attach(struct brcmf_pciedev_info *devinfo)
 }
 
 
+/* ChipCommon chipcontrol bit selecting the discrete FEM control pin mode */
+#define BRCMF_CC_CHIPCTL_4360_DISCRETE_FEMCTRL_MODE	BIT(4)
+
+/* On a MacBookPro14,3 with a BCM43602, 5 GHz only works with the discrete
+ * FEM control pin mode selected in the ChipCommon chipcontrol register. The
+ * bit is set after a reboot, but a power-on reset of the chip (e.g. over S3
+ * on battery) clears it and the firmware does not set it again. Other Apple
+ * BCM43602 boards are assumed to be set up the same way. Restore the bit
+ * before the firmware is started.
+ */
+static void brcmf_pcie_43602_apple_femctrl(struct brcmf_pciedev_info *devinfo)
+{
+	u32 val;
+
+	if (devinfo->pdev->subsystem_vendor != PCI_VENDOR_ID_APPLE)
+		return;
+
+	brcmf_pcie_select_core(devinfo, BCMA_CORE_CHIPCOMMON);
+	val = READCC32(devinfo, chipcontrol);
+	if (val & BRCMF_CC_CHIPCTL_4360_DISCRETE_FEMCTRL_MODE)
+		return;
+
+	brcmf_dbg(PCIE, "chipcontrol 0x%08x, setting discrete FEM control mode\n",
+		  val);
+	WRITECC32(devinfo, chipcontrol,
+		  val | BRCMF_CC_CHIPCTL_4360_DISCRETE_FEMCTRL_MODE);
+}
+
 static int brcmf_pcie_enter_download_state(struct brcmf_pciedev_info *devinfo)
 {
 	if (devinfo->ci->chip == BRCM_CC_43602_CHIP_ID) {
+		brcmf_pcie_43602_apple_femctrl(devinfo);
+
 		brcmf_pcie_select_core(devinfo, BCMA_CORE_ARM_CR4);
 		brcmf_pcie_write_reg32(devinfo, BRCMF_PCIE_ARMCR4REG_BANKIDX,
 				       5);
-- 
2.55.0

