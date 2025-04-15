Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908728A1DE
	for <brcm80211@lists.linux.dev>; Tue, 15 Apr 2025 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719670; cv=none; b=JQPIg3Xu65NQHGD8UzdNcHBZacMnzreuFRWnYH7TH0WXqdAgz/wb8E6eHZ/Pw/VrcFEeRUAzFmaujCej3uqIuXOcKJObRNeO3MYej/SiLQiTxWfqm30svr0FfpinLI3Un9l7aSnAHdG6NAuL9xolswEYblGZm1qEy8iN+lORER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719670; c=relaxed/simple;
	bh=SarEd5mR20idHoJNvSbnPeVnnEjWVIZIGYfMWjf11Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tq1ak1l6tj8gWlmC8S9/D9Vqe1yL4J/kf3sp5S5mGzIXWTik8nSMhQ16fc593bKvdlb6BiBmY3kQ/9SNzLG9W98kDPOTq7Fn76g1aYgPwtgT1qnpL8tve/OQHWVr2TrEOWyL4pwGW8WqZVSrIIRI7ckD4sA6ZLXNJNcfqkHmFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAD3oD0vT_5n_OEBCQ--.19632S2;
	Tue, 15 Apr 2025 20:21:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v4] brcm80211: fmac: Add error log in brcmf_usb_dl_cmd()
Date: Tue, 15 Apr 2025 20:20:01 +0800
Message-ID: <20250415122001.3325-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3oD0vT_5n_OEBCQ--.19632S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4kuFWkAw1UCFWrJryUGFg_yoW8AFW8pr
	4xXa90yFy8Wr1SganayrZxG3Z8K3Wktayvkay293s7ur4kCw10gr4rKFy09r4kCrWxC347
	XFWUtF1DXr17GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUnhL0DUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRANA2f+IlKYJQACsB

In brcmf_usb_dl_cmd(), the error logging is not enough to describe
the error state. And some caller of the brcmf_usb_dl_cmd() does not
handle its error. An error log in brcmf_usb_dl_cmd() is needed to
prevent silent failure.

Add error handling in brcmf_usb_dl_cmd() to log the command id and
error code in the brcmf_usb_dl_cmd() fails. In this way, every
invocation of the function logs a message upon failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v4: Fix spelling problem.
v3: Change patch name and comment. Move error log into brcmf_usb_dl_cmd().
v2: Remove redundant bailing out code.

 .../wireless/broadcom/brcm80211/brcmfmac/usb.c   | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
index d06c724f63d9..a11a6d9f3c2b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
@@ -744,12 +744,16 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info *devinfo, u8 cmd,
 	char *tmpbuf;
 	u16 size;
 
-	if ((!devinfo) || (devinfo->ctl_urb == NULL))
-		return -EINVAL;
+	if (!devinfo || !devinfo->ctl_urb) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	tmpbuf = kmalloc(buflen, GFP_ATOMIC);
-	if (!tmpbuf)
-		return -ENOMEM;
+	if (!tmpbuf) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	size = buflen;
 	devinfo->ctl_urb->transfer_buffer_length = size;
@@ -783,6 +787,10 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info *devinfo, u8 cmd,
 finalize:
 	kfree(tmpbuf);
 	return ret;
+
+err:
+	brcmf_err("dl cmd %u failed: err=%d\n", cmd, ret);
+	return ret;
 }
 
 static bool
-- 
2.42.0.windows.2

