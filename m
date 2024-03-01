Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EE06EB53
	for <brcm80211@lists.linux.dev>; Fri,  1 Mar 2024 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709301126; cv=none; b=fi0WTtBXYBzyRAN7yLxJLdqqS9RxtL9h+r1hQ9v0HyzpuwbThxcPf3At97B/d+1Z3Wj+PF1WTDfsf3QE4X9W88O9VrkqFr2qJfCfv1pGau0rasQq4i9o1hK11Na0nmuNumJlUNmF6eMvdHPjpAeDcuFsHtwLpDV+DEFrrEZjg+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709301126; c=relaxed/simple;
	bh=Vvdvmn75+7dlWtviPz9CBYNJ1bczhRoIOAinCLpgtxk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=XtDz63BTP0AqSZJUlyzyJig5fhvPO/3DuvDKbYyjVVYyg/HeOFqYDeQuwMXTgmNkzcBYRlYiZH/zS71bnBbdXPpr4NFYIIQPyg2DS39IWBS4db673+An9aHPGlQTBR0JVON0MBlSygSZsg60lFlVpoPp8Ml81yEALquH2xWDj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from ubuntu.localdomain (unknown [218.12.19.153])
	by mail-app2 (Coremail) with SMTP id by_KCgBXmahn3eFl7391Ag--.39411S2;
	Fri, 01 Mar 2024 21:51:45 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-kernel@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	kvalo@kernel.org,
	konrad.dybcio@linaro.org,
	hdegoede@redhat.com,
	minipli@grsecurity.net,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] wifi: brcmfmac: pcie: handle randbuf allocation failure
Date: Fri,  1 Mar 2024 21:51:34 +0800
Message-Id: <20240301135134.29577-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:by_KCgBXmahn3eFl7391Ag--.39411S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XFW3ury5uw18Zw1fJFWDArb_yoW8JF18pa
	yfJFyjkr1UWw4F9a98GFWxCryYv3ZIy3y2gr4xu3s3uryrAFyFkry0kFyI9r1UCr4Iya47
	tFWUtrnxWFsxJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwUHAWXg0lMPlwA1sp
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>

The kzalloc() in brcmf_pcie_download_fw_nvram() will return
null if the physical memory has run out. As a result, if we
use get_random_bytes() to generate random bytes in the randbuf,
the null pointer dereference bug will happen.

Return -ENOMEM from brcmf_pcie_download_fw_nvram() if kzalloc()
fails for randbuf.

Fixes: 91918ce88d9f ("wifi: brcmfmac: pcie: Provide a buffer of random bytes to the device")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index d7fb88bb6ae..5ab9c902e49 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -1730,6 +1730,8 @@ static int brcmf_pcie_download_fw_nvram(struct brcmf_pciedev_info *devinfo,
 
 			address -= rand_len;
 			randbuf = kzalloc(rand_len, GFP_KERNEL);
+			if (!randbuf)
+				return -ENOMEM;
 			get_random_bytes(randbuf, rand_len);
 			memcpy_toio(devinfo->tcm + address, randbuf, rand_len);
 			kfree(randbuf);
-- 
2.17.1

